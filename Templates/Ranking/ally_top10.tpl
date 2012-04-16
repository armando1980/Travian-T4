<?php
    for($i=1;$i<=0;$i++) {
    echo "Row ".$i;
    }
    $result = mysql_query("SELECT * FROM ".TB_PREFIX."alidata ORDER BY ap DESC, id ASC Limit 10");
    $result2 = mysql_query("SELECT * FROM ".TB_PREFIX."alidata WHERE id = '".$session->alliance."' ORDER BY ap DESC, id ASC Limit 1");
    $attRank = $ranking->getATop10AttRank($session->alliance);
    $defRank = $ranking->getATop10DefRank($session->alliance);
    $clpRank = $ranking->getATop10ClpRank($session->alliance);
    $rrRank = $ranking->getATop10RobbersRank($session->alliance);
    
?>
<div class="contentNavi tabNavi">
				<div class="container normal">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="statistiken.php?tid=4"><span class="tabItem">دیدکلی</span></a></div>
				</div>
				<div class="container normal">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="statistiken.php?tid=41"><span class="tabItem">مهاجم</span></a></div>
				</div>
				<div class="container normal">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="statistiken.php?tid=42"><span class="tabItem">مدافع</span></a></div>
				</div>
				<div class="container active">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="statistiken.php?tid=43"><span class="tabItem">تاپ 10</span></a></div>
				</div><div class="clear"></div>
</div>
<div id="statLeft" class="top10Wrapper">
<h4 class="round small  top10_offs">مهاجمین هفته</h4>

<table cellpadding="1" cellspacing="1" id="top10_offs" class="top10 row_table_data">
	<thead>
	<tr><td>رتبه</td><td>اتحاد</td><td>امتیاز</td></tr>
	</thead>
<tbody>
<?php
	while($row = mysql_fetch_array($result)){
		if($row['id']==$session->alliance) {
			echo "<tr class=\"own hl hover\">";
        } else {
        	echo "<tr class=\"hover\">";
		}
		echo "<td class=\"ra fc\">".$i++.".&nbsp;</td>";
		echo "<td class=\"pla hl\"><a href='allianz.php?aid=".$row['id']."'>".$row['name']."</a></td>";
		echo "<td class=\"val lc\">".$row['ap']."</td>";
		echo "</tr>";
	}
?>
		 <tr>
			<td colspan="3" class="empty"></td>
		</tr>
<?php
	while($row = mysql_fetch_array($result2)){
		if($attRank > 10) {
			echo "<tr class=\"none\"><td class=\"ra fc\">?&nbsp;</td>";
        } else {
        	echo "<tr class=\"own hl select\"><td class=\"ra fc\">".$attRank.".&nbsp;</td>";
        }
        
	  	if($attRank > 10) {
			echo "<td class=\"pla\">".$row['name']."</td>";
        } else {
        	echo "<td class=\"pla\"><a href='allianz.php?aid=".$row['id']."'>".$row['name']."</a></td>";
        }
		echo "<td class=\"val lc\">".$row['ap']."</td>";
		echo "</tr>";
	}
    if($session->alliance == 0){
		echo'<tr class="own hl"><td class="ra  fc">?</td><td class="al ">-</td><td class="val  lc"></td></tr>';
	}
?>
 </tbody>
</table>
<?php
    for($i=1;$i<=0;$i++) {
    echo "Row ".$i;
    }
    $result = mysql_query("SELECT * FROM ".TB_PREFIX."alidata ORDER BY dp DESC, id ASC Limit 10");
    $result2 = mysql_query("SELECT * FROM ".TB_PREFIX."alidata WHERE id = '".$session->alliance."' ORDER BY dp DESC, id ASC Limit 1");
?>
<h4 class="round small spacer top10_defs">مدافعین هفته</h4>
<table cellpadding="1" cellspacing="1" id="top10_defs" class="top10 row_table_data">
	<thead>
	<tr><td>رتبه</td><td>اتحاد</td><td>امتیاز</td></tr>
	</thead>
<tbody>
<?php
	while($row = mysql_fetch_array($result)){
		if($row['id']==$session->alliance) {
			echo "<tr class=\"own hl hover\">";
        } else {
        	echo "<tr class=\"hover\">";
		}
		echo "<td class=\"ra fc\">".$i++.".&nbsp;</td>";
		echo "<td class=\"pla hl\"><a href='allianz.php?aid=".$row['id']."'>".$row['name']."</a></td>";
		echo "<td class=\"val lc\">".$row['dp']."</td>";
		echo "</tr>";
	}
?>
	
		 <tr>
			<td colspan="3" class="empty"></td>
		</tr>
<?php
	while($row = mysql_fetch_array($result2)){
		if($defRank > 10) {
			echo "<tr class=\"none\"><td class=\"ra fc\">?&nbsp;</td>";
        } else {
        	echo "<tr class=\"own hl select\"><td class=\"ra fc\">".$defRank.".&nbsp;</td>";
        }
        
	  	if($defRank > 10) {
			echo "<td class=\"pla\">".$row['name']."</td>";
        } else {
        	echo "<td class=\"pla\"><a href='allianz.php?aid=".$row['id']."'>".$row['name']."</a></td>";
        }
		echo "<td class=\"val lc\">".$row['dp']."</td>";
		echo "</tr>";
	}
    if($session->alliance == 0){
		echo'<tr class="own hl"><td class="ra  fc">?</td><td class="al ">-</td><td class="val  lc"></td></tr>';
	}
?>

</tbody>
</table>
</div>

<div id="statRight" class="top10Wrapper">
<?php
    for($i=1;$i<=0;$i++) {
    echo "Row ".$i;
    }
    $result = mysql_query("SELECT * FROM ".TB_PREFIX."alidata ORDER BY clp DESC, id ASC Limit 10");
    $result2 = mysql_query("SELECT * FROM ".TB_PREFIX."alidata WHERE id = '".$session->alliance."' ORDER BY clp DESC, id ASC Limit 1");
?>
<h4 class="round small  top10_climbers">پیشرفت کننده های هفته</h4>
<table cellpadding="1" cellspacing="1" id="top10_climbers" class="top10 row_table_data">
	<thead>
	<tr><td>رتبه</td><td>اتحاد</td><td>جمعیت</td></tr>
	</thead>
<tbody>
<?php
	while($row = mysql_fetch_array($result)){
		if($row['id']==$session->alliance) {
			echo "<tr class=\"own hl hover\">";
        } else {
        	echo "<tr class=\"hover\">";
		}
		echo "<td class=\"ra fc\">".$i++.".&nbsp;</td>";
		echo "<td class=\"pla hl\"><a href='allianz.php?aid=".$row['id']."'>".$row['name']."</a></td>";
		echo "<td class=\"val lc\">".$row['clp']."</td>";
		echo "</tr>";
	}
?>
		 <tr>
			<td colspan="3" class="empty"></td>
		</tr>
<?php
	while($row = mysql_fetch_array($result2)){
		if($clpRank > 10) {
			echo "<tr class=\"none\"><td class=\"ra fc\">?&nbsp;</td>";
        } else {
        	echo "<tr class=\"own hl select\"><td class=\"ra fc\">".$clpRank.".&nbsp;</td>";
        }
        
	  	if($clpRank > 10) {
			echo "<td class=\"pla\">".$row['name']."</td>";
        } else {
        	echo "<td class=\"pla\"><a href='allianz.php?aid=".$row['id']."'>".$row['name']."</a></td>";
        }
		echo "<td class=\"val lc\">".$row['clp']."</td>";
		echo "</tr>";
	}
    if($session->alliance == 0){
		echo'<tr class="own hl"><td class="ra  fc">?</td><td class="al ">-</td><td class="val  lc"></td></tr>';
	}
?>
</tbody>
</table>
<?php
    for($i=1;$i<=0;$i++) {
    echo "Row ".$i;
    }
    $result = mysql_query("SELECT * FROM ".TB_PREFIX."alidata ORDER BY RR DESC, id ASC Limit 10");
    $result2 = mysql_query("SELECT * FROM ".TB_PREFIX."alidata WHERE id = '".$session->alliance."' ORDER BY RR DESC, id ASC Limit 1");
?>
<h4 class="round small spacer top10_raiders">دزدان هفته</h4>

<table cellpadding="1" cellspacing="1" id="top10_raiders" class="top10 row_table_data">
	<thead>
	<tr><td>رتبه</td><td>اتحاد</td><td>منابع</td></tr>
	</thead>
<tbody>
<?php
	while($row = mysql_fetch_array($result)){
		if($row['id']==$session->alliance) {
			echo "<tr class=\"own hl hover\">";
        } else {
        	echo "<tr class=\"hover\">";
		}
		echo "<td class=\"ra fc\">".$i++.".&nbsp;</td>";
		echo "<td class=\"pla hl\"><a href='allianz.php?aid=".$row['id']."'>".$row['name']."</a></td>";
		echo "<td class=\"val lc\">".$row['RR']."</td>";
		echo "</tr>";
	}
?>
		 <tr>
			<td colspan="3" class="empty"></td>
		</tr>
<?php
	while($row = mysql_fetch_array($result2)){
		if($rrRank > 10) {
			echo "<tr class=\"none\"><td class=\"ra fc\">?&nbsp;</td>";
        } else {
        	echo "<tr class=\"own hl select\"><td class=\"ra fc\">".$rrRank.".&nbsp;</td>";
        }
        
	  	if($rrRank > 10) {
			echo "<td class=\"pla\">".$row['name']."</td>";
        } else {
        	echo "<td class=\"pla\"><a href='allianz.php?aid=".$row['id']."'>".$row['name']."</a></td>";
        }
		echo "<td class=\"val lc\">".$row['RR']."</td>";
		echo "</tr>";
	}
    if($session->alliance == 0){
		echo'<tr class="own hl"><td class="ra  fc">?</td><td class="al ">-</td><td class="val  lc"></td></tr>';
	}
?>
</tbody>
</table>
</div><div class="clear">&nbsp;</div>