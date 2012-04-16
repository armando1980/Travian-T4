
<h1 class="titleInHeader">اردوگاه <span class="level">سطح <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid16">
<div class="build_desc">
<a href="#" onClick="return Travian.Game.iPopup(16,4);" class="build_logo">
<img class="g16 big white" src="img/x.gif" alt="اردوگاه" title="اردوگاه" />
</a>
لشکریان دهکده‌ی شما در این محل جمع می شوند. از اینجا شما قادر به ارسال آنها برای غارت، حمله، تسخیر و یا پشتیبانی دهکده های دیگر می باشید.</div>
<?php include("upgrade.tpl"); ?>
<?php if(!$village->resarray['f'.$id] < 1){ ?>
<div class="contentNavi tabNavi">
				<div class="container active">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="build.php?id=<?php echo $id; ?>"><span class="tabItem">دیدکلی</span></a></div>
				</div>
				<div class="container normal">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="a2b.php"><span class="tabItem">لشکرکشی</span></a></div>
				</div>
				<div class="container normal">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="warsim.php"><span class="tabItem">شبیه ساز جنگی</span></a></div>
				</div>
                <div class="container">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="build.php?id=39&amp;t=99"><span class="tabItem">لیست فارم ها</span></a></div>
				</div>
</div>

<?php
$units_type = $database->getMovement("34",$village->wid,1);
$units_incomming = count($units_type);
for($i=0;$i<$units_incomming;$i++){
	if($units_type[$i]['attack_type'] == 1)
		$units_incomming -= 1;
}
if($units_incomming >= 1){
echo "<h4 class=\"spacer\">لشگریان در حال آمدن (".$units_incomming.")</h4>";
include("16_incomming.tpl");
	} 
?>

<?php
$units_type = $database->getMovement("3",$village->wid,0);
$settlers = $database->getMovement("5",$village->wid,0);
$adventures = $database->getMovement("9",$village->wid,0);
$units_incomming = count($units_type);
for($i=0;$i<$units_incomming;$i++){
if($units_type[$i]['vref'] != $village->wid)
		$units_incomming -= 1;
}
$units_incomming += count($settlers);
$units_incomming += count($adventures);

if($units_incomming >= 1){
	echo "<h4 class=\"spacer\">لشکریان در حال رفتن (".$units_incomming.")</h4>";
	include("16_walking.tpl"); 
}

?>
		
<h4 class="spacer">لشگریان حاضر در روستا</h4>
        <table class="troop_details" cellpadding="1" cellspacing="1">
	<thead>
		<tr>
			<td class="role"><a href="karte.php?d=<?php echo $village->wid."&c=".$generator->getMapCheck($village->wid); ?>"><?php echo $village->vname; ?></a></td><td colspan="11">
            <a href="spieler.php?uid=<?php echo $session->uid; ?>">لشکریان خودی</a></td></tr></thead>
            <tbody class="units">
           <?php include("16_troops.tpl"); 
          
           ?>
            </tbody></table>
            
		<?php
		if(count($village->enforcetome) > 0) {
            foreach($village->enforcetome as $enforce) {
				echo "<table class=\"troop_details\" cellpadding=\"1\" cellspacing=\"1\"><thead><tr><td class=\"role\">
				<a href=\"karte.php?d=".$enforce['from']."&c=".$generator->getMapCheck($enforce['from'])."\">".$database->getVillageField($enforce['from'],"name")."</a></td>";
                if($enforce['hero'] > 0){ echo "<td colspan=\"11\">"; }else{ echo "<td colspan=\"10\">"; }
				echo "<a href=\"spieler.php?uid=".$database->getVillageField($enforce['from'],"owner")."\">لشکریان ".$database->getUserField($database->getVillageField($enforce['from'],"owner"),"username",0)."</a>";
				echo "</td></tr></thead><tbody class=\"units\">";
				$tribe = $database->getUserField($database->getVillageField($enforce['from'],"owner"),"tribe",0);
				$start = ($tribe-1)*10+1;
				$end = ($tribe*10);
				$coor = $database->getCoor($enforce['from']);
				echo "<tr><th class=\"coords\">
				<span class=\"coordinates coordinatesAligned\">
				<span class=\"coordinateY\">".$coor['x'].")</span>
				<span class=\"coordinatePipe\">|</span>
				<span class=\"coordinateX\">(".$coor['y']."</span>
				</span>
				<span class=\"clear\">‎</span></th>";
				for($i=$start;$i<=($end);$i++) {
					echo "<td><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" /></td>";	
				}
                if($enforce['hero'] > 0){
                echo "<td><img src=\"img/x.gif\" class=\"unit uhero\" title=\"".$technology->getUnitName(51)."\" /></td>";
                }
				echo "</tr><tr><th>لشگریان</th>";
				for($i=$start;$i<=($start+9);$i++) {
					if($enforce['u'.$i] == 0) {
						echo "<td class=\"none\">";
					}
					else {
						echo "<td>";
					}
					echo $enforce['u'.$i]."</td>";
				}
                if($enforce['hero'] > 0){
                	if($enforce['hero'] == 0) { echo "<td class=\"none\">"; }else { echo "<td>"; }
					echo $enforce['hero']."</td>";
                }
				echo "</tr></tbody>
				<tbody class=\"infos\"><tr><th>غذای مصرفی</th>";
                if($enforce['hero'] > 0){ echo "<td colspan=\"11\">"; }else{ echo "<td colspan=\"10\">"; }
                echo "<div class='sup'>".$technology->getUpkeep($enforce,$tribe)."<img class=\"r4\" src=\"img/x.gif\" title=\"گندم\" alt=\"گندم\" />در ساعت</div><div class='sback'><a href='a2b.php?w=".$enforce['id']."'>بازگرداندن</a></div></td></tr>";
            
				echo "</tbody></table>";
			}
		}
        
            if(count($village->enforcetoyou) > 0) {
            echo "<h4 class=\"spacer\">لشگریان در روستاهای دیگر</h4>";
            foreach($village->enforcetoyou as $enforce) {
                  echo "<table class=\"troop_details\" cellpadding=\"1\" cellspacing=\"1\"><thead><tr><td class=\"role\">
                  <a href=\"karte.php?d=".$enforce['from']."&c=".$generator->getMapCheck($enforce['from'])."\">".$database->getVillageField($enforce['from'],"name")."</a></td>";
                  if($enforce['hero'] > 0){ echo "<td colspan=\"11\">"; }else{ echo "<td colspan=\"10\">"; }
                  echo "<a href=\"karte.php?d=".$enforce['vref']."&c=".$generator->getMapCheck($enforce['vref'])."\">نیروی کمکی به ".$database->getVillageField($enforce['vref'],"name")."</a>";
                  echo "</td></tr></thead><tbody class=\"units\">";
                  $tribe = $database->getUserField($database->getVillageField($enforce['from'],"owner"),"tribe",0);
                  $start = ($tribe-1)*10+1;
                  $end = ($tribe*10);
                  $coor = $database->getCoor($enforce['vref']);
                  echo "<tr>
                  <th class=\"coords\">
					<span class=\"coordinates coordinatesAligned\">
                    <span class=\"coordinateY\">".$coor['x'].")</span>
                    <span class=\"coordinatePipe\">|</span>
                    <span class=\"coordinateX\">(".$coor['y']."</span>
                    </span>
                    <span class=\"clear\">‎</span></th>";
                  for($i=$start;$i<=($end);$i++) {
                  	echo "<td><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";	
                  }
                  if($enforce['hero'] > 0){
                	echo "<td><img src=\"img/x.gif\" class=\"unit uhero\" title=\"".$technology->getUnitName(51)."\" /></td>";
                  }
                  echo "</tr><tr><th>لشگریان</th>";
                  for($i=$start;$i<=($start+9);$i++) {
                  	if($enforce['u'.$i] == 0) {
						echo "<td class=\"none\">";
                  	} else {
						echo "<td>";
                  	}
                    echo $enforce['u'.$i]."</td>";
                  }
                  if($enforce['hero'] > 0){
                	if($enforce['hero'] == 0) { echo "<td class=\"none\">"; }else { echo "<td>"; }
					echo $enforce['hero']."</td>";
                  }
                  echo "</tr></tbody>
            <tbody class=\"infos\"><tr><th>غذای مصرفی</th>";
            if($enforce['hero'] > 0){ echo "<td colspan=\"11\">"; }else{ echo "<td colspan=\"10\">"; }
            echo "<div class='sup'>".$technology->getUpkeep($enforce,$tribe)."<img class=\"r4\" src=\"img/x.gif\" title=\"گندم\" alt=\"گندم\" />در ساعت</div><div class='sback'><a href='a2b.php?r=".$enforce['id']."'>پس کشیدن نیرو</a></div></td></tr>";
            
                  echo "</tbody></table>";
            }
            }
            }
            ?>




</p></div>
