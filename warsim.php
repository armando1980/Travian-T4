<?php

include("GameEngine/Village.php");
$start = $generator->pageLoadTimeStart();
$battle->procSim($_POST);
include "Templates/html.tpl";
?>
<body class="v35 webkit chrome warsim">
	<div id="wrapper"> 
		<img id="staticElements" src="img/x.gif" alt="" /> 
		<div id="logoutContainer"> 
			<a id="logout" href="logout.php" title="<?php echo LOGOUT; ?>">&nbsp;</a> 
		</div> 
		<div class="bodyWrapper"> 
			<img style="filter:chroma();" src="img/x.gif" id="msfilter" alt="" /> 
			<div id="header"> 
				<div id="mtop">
					<a id="logo" href="<?php echo HOMEPAGE; ?>" target="_blank" title="<?php echo SERVER_NAME ?>"></a>
					<ul id="navigation">
						<li id="n1" class="resources">
							<a class="" href="dorf1.php" accesskey="1" title="<?php echo HEADER_DORF1; ?>"></a>
						</li>
						<li id="n2" class="village">
							<a class="" href="dorf2.php" accesskey="2" title="<?php echo HEADER_DORF2; ?>"></a>
						</li>
						<li id="n3" class="map">
							<a class="" href="karte.php" accesskey="3" title="<?php echo HEADER_MAP; ?>"></a>
						</li>
						<li id="n4" class="stats">
							<a class="" href="statistiken.php" accesskey="4" title="<?php echo HEADER_STATS; ?>"></a>
						</li>
<?php
    	if(count($database->getMessage($session->uid,7)) >= 1000) {
			$unmsg = "+1000";
		} else { $unmsg = count($database->getMessage($session->uid,7)); }
		
    	if(count($database->getMessage($session->uid,8)) >= 1000) {
			$unnotice = "+1000";
		} else { $unnotice = count($database->getMessage($session->uid,8)); }
?>
<li id="n5" class="reports"> 
<a href="berichte.php" accesskey="5" title="<?php echo HEADER_NOTICES; ?><?php if($message->nunread){ echo' ('.count($database->getMessage($session->uid,8)).')'; } ?>"></a>
<?php
if($message->nunread){
	echo "<div class=\"ltr bubble\" title=\"".$unnotice." ".HEADER_NOTICES_NEW."\" style=\"display:block\">
			<div class=\"bubble-background-l\"></div>
			<div class=\"bubble-background-r\"></div>
			<div class=\"bubble-content\">".$unnotice."</div></div>";
}
?>
</li>
<li id="n6" class="messages"> 
<a href="nachrichten.php" accesskey="6" title="<?php echo HEADER_MESSAGES; ?><?php if($message->unread){ echo' ('.count($database->getMessage($session->uid,7)).')'; } ?>"></a> 
<?php
if($message->unread) {
	echo "<div class=\"ltr bubble\" title=\"".$unmsg." ".HEADER_MESSAGES_NEW."\" style=\"display:block\">
			<div class=\"bubble-background-l\"></div>
			<div class=\"bubble-background-r\"></div>
			<div class=\"bubble-content\">".$unmsg."</div></div>";
}
?>
</li>

</ul>
<div class="clear"></div> 
</div> 
</div>
					<div id="mid">
<?php include("Templates/menu.tpl"); ?>

												<div class="clear"></div> 
						<div id="contentOuterContainer"> 
							<div class="contentTitle">&nbsp;</div>
<div class="contentContainer">
<div id="content"  class="warsim">
<h1>شبیه ساز جنگی</h1>
<form action="warsim.php" method="post">
<?php
if(isset($_POST['result'])) {
    $target = isset($_POST['target'])? $_POST['target'] : array();
    $tribe = isset($_POST['mytribe'])? $_POST['mytribe'] : $session->tribe;
    echo '<h4 class="round">نوع حمله: ';
    echo $form->getValue('ktyp') == 0? "عادی" : "غارت";
    echo "</h4>";
    include("Templates/Simulator/res_a".$tribe.".tpl");
    foreach($target as $tar) {
        include("Templates/Simulator/res_d".$tar.".tpl");
    }
    echo '<h4 class="round">تنظیمات حمله</h4>';
    if (isset($_POST['result'][3])&&isset($_POST['result'][4])){
        if ($_POST['result'][4]>$_POST['result'][3]){
            echo "";
        }elseif ($_POST['result'][4]==0){
            echo "";
        }else{
            $demolish=$_POST['result'][4]/$_POST['result'][3];
            //$Katalife=round($_POST['result'][4]-($_POST['result'][4]*$_POST['result'][1]));
            //$totallvl = round($form->getValue('kata')-($form->getValue('kata') * $demolish));
            $totallvl = round(sqrt(pow(($form->getValue('kata')+0.5),2)-($_POST['result'][4]*8)));
            echo "<p>ساختمان از سطح <b>".$form->getValue('kata')."</b> به سطح <b>".$totallvl."</b> آسیب می بیند.</p>";
        }
    }
}
$target = isset($_POST['target'])? $_POST['target'] : array();
$tribe = isset($_POST['mytribe'])? $_POST['mytribe'] : $session->tribe;
if(count($target) > 0) {
    include("Templates/Simulator/att_".$tribe.".tpl");
	echo '<div id="defender"><div class="fighterType"><div class="boxes boxesColor green"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">مدافع</div></div></div><div class="clear"></div>';

    foreach($target as $tar) {
        include("Templates/Simulator/def_".$tar.".tpl");
    }
    include("Templates/Simulator/def_end.tpl");
    echo "</div><div class=\"clear\"></div>";
}
?>
<table id="select" cellpadding="1" cellspacing="1">
		<tbody>
			<tr>
				<td>
					<div class="fighterType">
						<div class="boxes boxesColor red"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">حمله کننده	</div>
				</div>
					</div>
					<div class="clear"></div>

					<div class="choice">
                    <label><input class="radio" type="radio" name="a1_v" value="1" <?php if($tribe == 1) { echo "checked"; } ?>> رومی‌ها</label><br/>
        <label><input class="radio" type="radio" name="a1_v" value="2" <?php if($tribe == 2) { echo "checked"; } ?>> توتن‌ها </label><br/>
        <label><input class="radio" type="radio" name="a1_v" value="3" <?php if($tribe == 3) { echo "checked"; } ?>> گول‌ها</label>
					</div>
				</td>

				<td>
					<div class="fighterType">
						<div class="boxes boxesColor green"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">مدافع	</div>
				</div>
					</div>
					<div class="clear"></div>

					<div class="choice">
						<label><input class="check" type="checkbox" name="a2_v1" value="1" <?php if(in_array(1,$target)) { echo "checked"; } ?>> رومی‌ها</label><br>
						<label><input class="check" type="checkbox" name="a2_v2" value="1" <?php if(in_array(2,$target)) { echo "checked"; } ?>> توتن‌ها</label><br>
						<label><input class="check" type="checkbox" name="a2_v3" value="1" <?php if(in_array(3,$target)) { echo "checked"; } ?>> گول‌ها</label><br>
						<label><input class="check" type="checkbox" name="a2_v4" value="1" <?php if(in_array(4,$target)) { echo "checked"; } ?>> طبیعت</label>
					</div>
				</td>

				<td>
					<div class="fighterType">
						<div class="boxes boxesColor gray"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">نوع حمله	</div>
				</div>
					</div>
					<div class="clear"></div>

					<div class="choice">
                    <label><input class="radio" type="radio" name="ktyp" value="0" <?php if($form->getValue('ktyp') == 0 || $form->getValue('ktyp') == "") { echo "checked"; } ?>> عادی</label><br/>

        <label><input class="radio" type="radio" name="ktyp" value="1" <?php if($form->getValue('ktyp') == 1) { echo "checked"; } ?>> غارت</label><br/>
						<input type="hidden" name="uid" value="<?php echo $session->uid; ?>">
					</div>
				</td>
			</tr>
		</tbody>
	</table>


<p class="btn"><button type="submit" value="شبیه سازی جنگی" name="s1" id="btn_ok"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">شبیه سازی جنگی</div></div></button></p>
</form>
</div>
<div class="clear">&nbsp;</div>

<div class="clear"></div>
</div>
<div class="contentFooter">&nbsp;</div>
</div>

                    
<?php
include("Templates/sideinfo.tpl");
include("Templates/footer.tpl");
include("Templates/header.tpl");
include("Templates/res.tpl");
include("Templates/vname.tpl");
include("Templates/quest.tpl");
?>

</div>
<div id="ce"></div>
</div>
</body>
</html>
