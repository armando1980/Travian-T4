<h1 class="titleInHeader">خزانه <span class="level">سطح <?php echo $village->resarray['f'.$id]; ?></span></h1>

    <div id="build" class="gid27">
    <div class="build_desc">
        <a href="#" onClick="return Travian.Game.iPopup(27,4);" class="build_logo">
        <img class="building big white g27" src="img/x.gif" alt="خزانه" title="خزانه"></a>
        ثروت امپراطوری شما در خزانه نگهداری می شود. خزانه تنها برای یک کتیبه جا دارد. براي نگهداري كتيبه كوچك شما به خزانه سطح 10 و براي نگهداري كتيبه بزرگ و يا منحصر به فرد شما به خزانه سطح 20 نياز خواهيد داشت. فعال شدن کتیبه در سرورهای معمولی 24 ساعت و در سرور اسپید 12 ساعت طول خواهد کشید.</div>
        
        <?php
include("upgrade.tpl");
        include ("27_menu.tpl");

?>
        <h4 class="round">کتیبه های کوچک</h4>
        <table id="show_artefacts" cellpadding="1" cellspacing="1">
    		<thead>
    			<tr>
    				<td></td>
	    			<td>نام كتيبه</td>
	    			<td>بازيكن</td>
	    			<td>اتحاد</td>
    			</tr>
    		</thead>
    		<tbody>
            <?php

        if(mysql_num_rows(mysql_query("SELECT * FROM " . TB_PREFIX . "artefacts")) == 0) {
        	echo '<td colspan="4" class="none">کتیبه ای موجود نیست</td>';
        } else {


        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 1 AND type = 1");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">(' . $row['effect'] . ')</span><div class="info">خزانه <b>10</b>, تاثیر <b>دهكده حاوي كتيبه</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4" class="empty"></td></tr>
            
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 1 AND type = 2");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">(' . $row['effect'] . ')</span><div class="info">خزانه <b>10</b>, تاثیر <b>دهكده حاوي كتيبه</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4" class="empty"></td></tr>
            
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 1 AND type = 4");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">(' . $row['effect'] . ')</span><div class="info">خزانه <b>10</b>, تاثیر <b>دهكده حاوي كتيبه</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4" class="empty"></td></tr>
            
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 1 AND type = 5");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">(' . $row['effect'] . ')</span><div class="info">خزانه <b>10</b>, تاثیر <b>دهكده حاوي كتيبه</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4" class="empty"></td></tr>
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 1 AND type = 6");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">(' . $row['effect'] . ')</span><div class="info">خزانه <b>10</b>, تاثیر <b>دهكده حاوي كتيبه</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4" class="empty"></td></tr>
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 1 AND type = 8");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">(' . $row['effect'] . ')</span><div class="info">خزانه <b>10</b>, تاثیر <b>دهكده حاوي كتيبه</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4" class="empty"></td></tr>
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 1 AND type = 9");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">(' . $row['effect'] . ')</span><div class="info">خزانه <b>10</b>, تاثیر <b>دهكده حاوي كتيبه</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4" class="empty"></td></tr>
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 1 AND type = 9");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_9" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">(' . $row['effect'] . ')</span><div class="info">خزانه <b>10</b>, تاثیر <b>تمام دهكده ها</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}
			?>
            
            <tr><td colspan="4" class="empty"></td></tr>
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 1 AND type = 7");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_10" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">(' . $row['effect'] . ')</span><div class="info">خزانه <b>10</b>, تاثیر <b>تمام دهكده ها</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}
			?>
            <tr><td colspan="4" class="empty"></td></tr>
            <?php
        	unset($artefact);
        	unset($row);
        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 1 AND type = 3");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">(' . $row['effect'] . ')</span><div class="info">خزانه <b>10</b>, تاثیر <b>دهكده حاوي كتيبه</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
        <?php

        }

?>
            
    	</tbody></table></div>

        
