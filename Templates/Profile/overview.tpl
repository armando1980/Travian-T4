<?php
$displayarray = $database->getUserArray($_GET['uid'],1);
$varmedal = $database->getProfileMedal($_GET['uid']);

$profiel="".$displayarray['desc1']."".md5(skJkev3)."".$displayarray['desc2']."";
require("medal.php");
$profiel=explode("".md5(skJkev3)."", $profiel);

$varray = $database->getProfileVillages($_GET['uid']);
$totalpop = 0;
foreach($varray as $vil) {
	$totalpop += $vil['pop'];
}
		
?>
<h1 class="titleInHeader">پروفایل بازیکن - <?php echo $displayarray['username']; ?></h1>
<h4 class="round">جزئیات</h4>
<?php
    if($_GET['uid']==2){
    echo '<img src="gpack/travian_Travian_4.0_41/img/t/t10_2.jpg" border="0">';
    } else {
    echo '<img class="heroImage" style="width:160px;height:205px;" src="hero_body.php?uid='.$_GET['uid'].'&size=profile&'.md5($_GET['uid']).'" alt="قهرمان">';
    }
?>
<table cellpadding="1" cellspacing="1" id="details" class="transparent">
	<tr>
		<th>رتبه</th>
		<td><?php echo $ranking->getUserRank($displayarray['username']); ?></td>
	</tr>
	<tr>
		<th>نژاد</th>
		<td><?php 
                if($displayarray['tribe'] == 1) {
                echo "رومی ها";
                }
                else if($displayarray['tribe'] == 2) {
                echo "توتن ها";
                }
                else if($displayarray['tribe'] == 3) {
                echo "گول ها";
                }
				else if($displayarray['tribe'] == 4) {
                echo "طبیعت";
                
                }else if($displayarray['tribe'] == 5) {
                echo "ناتارها";
                }				?></td>
	</tr>
	<tr>
		<th>اتحاد</th>
		<td><?php if($displayarray['alliance'] == 0) {
                echo "-";
                }
                else {
                $displayalliance = $database->getAllianceName($displayarray['alliance']);
                echo "<a href=\"allianz.php?aid=".$displayarray['alliance']."\">".$displayalliance."</a>";
                } ?></td>
	</tr>
	<tr>
		<th>دهکده ها</th>
		<td><?php echo count($varray);?></td>
	</tr>
	<tr>
		<th>جمعیت</th>
		<td><?php echo $totalpop;?></td>
	</tr>
    <?php 
			//Date of Birth
            if(isset($displayarray['birthday']) && $displayarray['birthday'] != 0) {
			$age = date('Y') - substr($displayarray['birthday'],0,4);
				if ((date('m') - substr($displayarray['birthday'],5,2)) < 0){$age --;}
				elseif ((date('m') - substr($displayarray['birthday'],5,2)) == 0){
					if(date('d') < substr($displayarray['birthday'],8,2)){$age --;}
				}
            echo "<tr><th>سن:</th><td>$age</td></tr>";
            }
			//Gender
            if(isset($displayarray['gender']) && $displayarray['gender'] != 0) {
            $gender = ($displayarray['gender']== 1)? "مرد" : "زن";
            echo "<tr><th>جنسیت</th><td>".$gender."</td></tr>";
            }
			//Location
            if($displayarray['location'] != "") {
            echo "<tr><th>موقعیت</th><td>".$displayarray['location']."</td></tr>";
            }
            ?>
    		<tr>
        	<?php
            	if($_GET['uid'] == $session->uid) {
                	if($session->is_sitter){
            			echo "<td colspan=\"2\"> <span class=\"a arrow disabled\">ویرایش پروفایل</span></td>";
                    }else{
                    	echo "<td colspan=\"2\"> <a class=\"arrow\" href=\"spieler.php?s=1\">ویرایش پروفایل</a></td>";
                    }
                } else {
            		echo "<td colspan=\"2\"> <a class=\"message messageStatus messageStatusUnread\" href=\"nachrichten.php?t=1&amp;id=".$_GET['uid']."\">نوشتن پیام</a></td>";
			 	}
             ?>
	</tr>
</table>

	
<div class="clear"></div>
<br />

<h4 class="round">توضیح</h4>

<div class="description description1"><?php echo nl2br($profiel[1]); ?></div>
<div class="description description2"><?php echo nl2br($profiel[0]); ?></div>

<div class="clear"></div>


<h4 class="round">دهکده ها</h4>

<table cellpadding="1" cellspacing="1" id="villages">
	<thead>
		<tr>
			<th class="name">نام</th>
            <th>آبادی‌</th>
			<th>جمعیت</th>
			<th>مختصات</th>
		</tr>
	</thead>
	<tbody>
        <?php 
    foreach($varray as $vil) {
    	$coor = $database->getCoor($vil['wref']);
    	echo "<tr><td class=\"name\"><a href=\"karte.php?x=".$coor['y']."&amp;y=".$coor['x']."\">".$vil['name']."</a> ";
        if($vil['capital'] == 1) {
        echo "<span class=\"mainVillage\">(پایتخت)</span>";
        }
        echo "</td><td class=\"oases\">";
        
$prefix = "".TB_PREFIX."odata";
$uid = $_GET['uid']; $wref = $vil['wref'];
$sql2 = mysql_query("SELECT * FROM $prefix WHERE owner = $uid AND conqured = $wref");
while($row = mysql_fetch_array($sql2)){
$type = $row["type"];
switch($type) {
case 1:
case 2:
echo  "<img class='r1' src='img/x.gif' title='چوب'>";
break;
case 3:
echo  "<img class='r1' src='img/x.gif' title='چوب'> <img class='r4' src='img/x.gif' title='گندم'>";
break;
case 4:
case 5:
echo  "<img class='r2' src='img/x.gif' title='خشت'>";
break;
case 6:
echo  "<img class='r2' src='img/x.gif' title='خشت'> <img class='r4' src='img/x.gif' title='گندم'>";
case 7:
case 8:
echo  "<img class='r3' src='img/x.gif' title='آهن'>";
break;
case 9:
echo  "<img class='r3' src='img/x.gif' title='آهن'> <img class='r4' src='img/x.gif' title='گندم'>";
break;
case 10:
case 11:
case 12:
echo  "<img class='r4' src='img/x.gif' title='گندم'>";
break;
}
}
        echo "</td>";
        echo "<td class=\"inhabitants\">".$vil['pop']."</td><td class=\"coords\">";
        echo "<a href=\"karte.php?x=".$coor['y']."&amp;y=".$coor['x']."\">
        <span class=\"coordinates coordinatesAligned\">
        <span class=\"coordinateY\">".$coor['x'].")</span>
        <span class=\"coordinatePipe\">|</span>
        <span class=\"coordinateX\">(".$coor['y']."</span>
        </span><span class=\"clear\">‎</span>
        </td></tr>";
    }
    ?>
</tbody>
</table>

