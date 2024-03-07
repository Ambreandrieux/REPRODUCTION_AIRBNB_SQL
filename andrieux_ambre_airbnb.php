<?php
// Établir une connexion à la base de données
$lien = mysqli_connect("localhost", "root", "", "dm_airbnb");
mysqli_query($lien,"set names utf8");
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Airbnb</title>
	<link rel="icon" href="logo_onglet.png" />
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
</head>
<style>
	/* Styles CSS pour le contenu HTML */
	html {
		font-family: 'Roboto', sans-serif;
		font-size: 14px;
	}
	
	header>img {
		width: 150px;
		height: 50px;
	}
	
	hr {
		opacity: 30%;
	}
	
	.filtre-form {
		margin-top: 20px;
		margin-bottom: 20px;
		display: flex;
		align-items: center;
		gap: 10px;
	}
	
	.filtre-form select,
	.filtre-form button {
		padding: 5px 10px;
		border-radius: 5px;
		border: none;
		background-color: #f2f2f2;
		font-size: 16px;
	}
	
	.filtre-form button {
		background-color: #ff5a60;
		color: white;
		cursor: pointer;
	}
	
	.filtre-form select:focus,
	.filtre-form button:focus {
		outline: none;
	}
	
	.filtre-form select option {
		background-color: white;
		color: #000;
	}
	
	.container {
		padding-top: 20px;
		width: 95%;
		margin: auto;
	}
	
	.annonces {
		display: flex;
		flex-direction: row;
		justify-content: center;
		flex-wrap: wrap;
		column-gap: 10px;
		margin-right: 5px;
	}
	
	.annonce {
		margin-bottom: 1rem;
		position: relative;
	}
	
	.superhote {
		position: absolute;
		top: 20px;
		left: 10px;
		background-color: white;
		padding: 5px 10px;
		border-radius: 5px;
		font-size: 13px;
		font-weight: bold;
		transform: translateY(-50%);
	}
	
	.annonce img {
		width: 300px;
		height: 200px;
		border-radius: 10px;
	}
	
	.note-container {
		display: flex;
		flex-direction: row;
		align-items: center;
		width: fit-content;
		height: 30px;
		gap: 5px;
	}
	
	.icons {
		width: 20px !important;
		height: 20px !important;
	}
	
	.annonce h4 {
		margin: 3px;
	}
	
	.annonce h4:last-child {
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		display: inline-block;
		
	}
	
	.translate {
		display: inline-block;
		width: 20px !important;
		height: 20px !important;
		margin-right: 5px;
	}
	
</style>

<body>
<div class="container">
	<header>
		<img src="logo.png">
	</header>
	
	<hr/>
	
	<?php
	// Récupération des données de la base de données
	$sqlAnnonce = "SELECT * FROM annonce ";
	$queryAnnonce = mysqli_query($lien, $sqlAnnonce);
	$annonces = array();
	while ($result = mysqli_fetch_assoc($queryAnnonce)) {
		$annonces[$result['id_annonce']] = $result;
	}
	
	$sqlVille = "SELECT * FROM ville";
	$queryVille = mysqli_query($lien, $sqlVille);
	$villes = array();
	while ($result = mysqli_fetch_assoc($queryVille)) {
		$villes[$result['id_ville']] = $result['ville_nom'];
	}
	
	$sqlTypeLogement = "SELECT * FROM type_logement";
	$queryTypeLogement = mysqli_query($lien, $sqlTypeLogement);
	$typesLogement = array();
	while ($result = mysqli_fetch_assoc($queryTypeLogement)) {
		$typesLogement[$result['id_type_logement']] = $result['type_logement_libelle'];
	}
	
	$sqlNotes = "SELECT AVG(note_valeur) as moyenne, COUNT(*) as nombre, id_annonce FROM note GROUP BY id_annonce";
	$queryNotes = mysqli_query($lien, $sqlNotes);
	$notes = array();
	while ($result = mysqli_fetch_assoc($queryNotes)) {
		$notes[$result['id_annonce']] = array('moyenne' => $result['moyenne'], 'nombre' => $result['nombre']);
	}
	?>
	
	<form class="filtre filtre-form" method="GET" action="">
		<!-- Formulaire de filtrage des annonces -->
		<select name="type_logement">
	        <option value="">Types de logement</option>
	        <?php
	        foreach ($typesLogement as $id_type_logement => $type_logement) {
	            echo "<option value=\"$id_type_logement\">$type_logement</option>";
	        }
	        ?>
		</select>
		<select name="ville">
			<option value="">Villes</option>
			<?php
			foreach ($villes as $id_ville => $ville) {
				echo "<option value=\"$id_ville\">$ville</option>";
			}
			?>
		</select>
		<button type="submit">Filtrer</button>
	</form>
	
	<?php
	// Récupérer les valeurs filtrées du formulaire
	$typeLogementFilter = isset($_GET['type_logement']) ? $_GET['type_logement'] : '';
	$villeFilter = isset($_GET['ville']) ? $_GET['ville'] : '';
	
	// Filtrer les annonces en fonction du type de logement et de la ville
	$filteredAnnonces = array_filter($annonces, function ($annonce) use ($typeLogementFilter, $villeFilter) {
	if ($typeLogementFilter && $annonce['id_type_logement'] != $typeLogementFilter) {
	return false;
	}
	if ($villeFilter && $annonce['id_ville'] != $villeFilter) {
	return false;
	}
	return true;
	});
	
	// Vérifier si aucune annonce filtrée n'a été trouvée
	if (empty($filteredAnnonces)) {
	echo "<p>Aucun résultat trouvé.</p>";
	}
	?>
	
	<div class="annonces">
		<!-- Contenu des annonces filtrées ou non -->
		<?php
		foreach ($filteredAnnonces as $annonce) {
			echo "<div class=\"annonce\">";
			if (isset($notes[$annonce["id_annonce"]]) && $notes[$annonce["id_annonce"]]['moyenne'] > 4.8) {
				echo "<div class=\"superhote\">SUPERHOTE</div>";
			}
			echo "<img src=" . $annonce["annonce_img"] . ">";
			echo "<div class=\"note-container\" data-note=\"";
			if (isset($notes[$annonce["id_annonce"]]['nombre'])) {
				echo $notes[$annonce["id_annonce"]]['nombre'];
			} else {
				echo '0';
			}
			echo "\">";
			echo "<img class=\"icons\" src=\"star.png\"> ";
			if (isset($notes[$annonce["id_annonce"]])) {
				echo "<h4 class=\"note\">" . round($notes[$annonce["id_annonce"]]['moyenne'], 2) . "(" . $notes[$annonce["id_annonce"]]['nombre'] . ")</h4>";
			} else {
				echo "<h4>Pas de note</h4>";
			}
			echo "</div>";
			
			echo "<h4> Logement Entier : " . $typesLogement[$annonce["id_type_logement"]] . " -" . $villes[$annonce["id_ville"]] . "</h4>";
			echo "<img class=\"translate\" src=\"translate.png\">";
			echo "<h4>" . mb_strimwidth($annonce["annonce_titre"], 0, 45, "...") . "</h4>";
			echo "</div>";
		}
		?>
	</div>
</div>
</body>
</html>