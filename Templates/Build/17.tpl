<h1 class="titleInHeader">بازار <span class="level">سطح <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid17">
<div class="build_desc">
<a href="#" onClick="return Travian.Game.iPopup(17,4);" class="build_logo"> 
	<img class="building big white g17" src="img/x.gif" alt="بازار" title="بازار" /> 
</a> 
در بازار شما قادر به تجارت منابع با دیگر بازیکنان می باشید. هر قدر سطح آن بالا باشد، قادر به تجارت بیشتر منابع در هر تجارت خواهید بود.</div> 
 
<?php
include("upgrade.tpl");
include("17_menu.tpl");
?>

<script language="JavaScript"> 
<!--
var haendler = <?php echo $market->merchantAvail(); ?>;
var carry = <?php echo $market->maxcarry; ?>;
//-->
</script>
<div class="boxes boxesColor gray traderCount"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">تاجر ها <?php echo $market->merchantAvail(); ?> / <?php echo $market->merchant; ?></div>
				</div><div class="clear"></div>
<?php
$allres = "".$_POST['r1']."+".$_POST['r2']."+".$_POST['r3']."+".$_POST['r4']."";
if($_POST['x']!=0 && $_POST['y']!=0){
	$getwref = $database->getVilWref($_POST['x'],$_POST['y']);
	$checkexist = $database->checkVilExist($getwref);
}
if(isset($_POST['ft'])=='check' && $allres!=0 && $_POST['x']!=0 && $_POST['y']!=0 && $checkexist){
?>
<form method="POST" name="snd" action="build.php"> 
<input type="hidden" name="ft" value="mk1">
<input type="hidden" name="id" value="<?php echo $id; ?>">
<input type="hidden" name="x" value="<?php echo $_POST['x']; ?>">
<input type="hidden" name="y" value="<?php echo $_POST['y']; ?>">
<table id="send_select" class="send_res" cellpadding="1" cellspacing="1">
	<tr>
		<td class="ico"><img class="r1" src="img/x.gif" alt="چوب" title="چوب" /></td> 
		<td class="nam"> چوب</td> 
		<td class="val"><input class="text disabled" type="text" name="r1" id="r1" value="<?php echo $_POST['r1']; ?>" readonly="readonly"></td> 
		<td class="max"> / <span class="none"><B><?php echo $market->maxcarry; ?></B></span> </td> 
	</tr>
    <tr> 
		<td class="ico"><img class="r2" src="img/x.gif" alt="خشت" title="خشت" /></td> 
		<td class="nam"> خشت</td> 
		<td class="val"><input class="text disabled" type="text" name="r2" id="r2" value="<?php echo $_POST['r2']; ?>" readonly="readonly"></td> 
		<td class="max"> / <span class="none"><b><?php echo$market->maxcarry; ?></b></span> </td> 
	</tr>
    <tr> 
		<td class="ico"><img class="r3" src="img/x.gif" alt="آهن" title="آهن" /></td> 
		<td class="nam"> آهن</td> 
		<td class="val"><input class="text disabled" type="text" name="r3" id="r3" value="<?php echo $_POST['r3']; ?>" readonly="readonly"> 
		</td> 
		<td class="max"> / <span class="none"><b><?php echo $market->maxcarry; ?></b></span> </td> 
	</tr>
    <tr> 
		<td class="ico"><img class="r4" src="img/x.gif" alt="گندم" title="گندم" /></td> 
		<td class="nam"> گندم</td> 
		<td class="val"> <input class="text disabled" type="text" name="r4" id="r4" value="<?php echo $_POST['r4']; ?>" readonly="readonly"> 
		</td> 
		<td class="max"> / <span class="none"><B><?php echo $market->maxcarry; ?></B></span></td> 
	</tr></table> 
<table id="target_validate" class="res_target" cellpadding="1" cellspacing="1">
	<tbody><tr>
		<th>هدف:</th>
        <?php
        $getwref = $database->getVilWref($_POST['x'],$_POST['y']);
        $getvildata = $database->getVillage($getwref);
        ?>
		<td class="vil"><a href="karte.php?x=<?php echo $_POST['y']; ?>&amp;y=<?php echo $_POST['x']; ?>"><span class="coordinates coordinatesWithText"><span class="coordText"><?php echo $getvildata['name']; ?></span><span class="coordinatesWrapper"><span class="coordinateY"><?php echo $_POST['x']; ?>)</span><span class="coordinatePipe">|</span><span class="coordinateX">(<?php echo $_POST['y']; ?></span></span></span><span class="clear">‎</span></a></td>
	</tr>
	<tr>
		<th>بازیکن:</th>
		<td><a href="spieler.php?uid=<?php echo $getvildata['owner']; ?>"><?php echo $database->getUserField($getvildata['owner'],username,0); ?></a></td>
	</tr>
	<tr>
		<th>مدت زمان:</th>
		<td>-</td>
	</tr>
	<tr>
		<th>تاجرها:</th>
		<td><?php
        $resource = array($_POST['r1'],$_POST['r2'],$_POST['r3'],$_POST['r4']); 
        echo ceil((array_sum($resource)-0.1)/$market->maxcarry); ?></td>
	</tr>

	<tr>
		<td colspan="2">
					</td>
	</tr>

</tbody></table>
<div class="clear"></div>
<p>
<button type="submit" value="ok" name="s1" id="btn_ok" class="dynamic_img" tabindex="8"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">تایید</div></div></button>
</p></form>
<?php }else{ ?>
<form method="POST" name="snd" action="build.php"> 
<input type="hidden" name="ft" value="check">
<input type="hidden" name="id" value="<?php echo $id; ?>">
<table id="send_select" class="send_res" cellpadding="1" cellspacing="1">

<tr>

		<td class="ico"> 
			<a href="#" onClick="upd_res(1,1); return false;"><img class="r1" src="img/x.gif" alt="چوب" title="چوب" /></a> 
		</td> 
		<td class="nam"> 
			چوب
		</td> 
		<td class="val"> 
			<input class="text" type="text" name="r1" id="r1" value="<?php echo $_POST['r1']; ?>" maxlength="5" onKeyUp="upd_res(1)" tabindex="1"> 
		</td> 
		<td class="max"> 
			/ <a href="#" onMouseUp="add_res(1);" onClick="return false;"><?php echo $market->maxcarry; ?></a> 
		</td> 
	</tr><tr> 
		<td class="ico"> 
			<a href="#" onClick="upd_res(2,1); return false;"><img class="r2" src="img/x.gif" alt="خشت" title="خشت" /></a> 
		</td> 
		<td class="nam"> 
			خشت
		</td> 
		<td class="val"> 
			<input class="text" type="text" name="r2" id="r2" value="<?php echo $_POST['r2']; ?>" maxlength="5" onKeyUp="upd_res(2)" tabindex="2"> 
		</td> 
		<td class="max"> 
			/ <a href="#" onMouseUp="add_res(2);" onClick="return false;"><?php echo$market->maxcarry; ?></a> 
		</td> 
	</tr><tr> 
		<td class="ico"> 
			<a href="#" onClick="upd_res(3,1); return false;"><img class="r3" src="img/x.gif" alt="آهن" title="آهن" /></a> 
		</td> 
		<td class="nam"> 
			آهن
		</td> 
		<td class="val"> 
			<input class="text" type="text" name="r3" id="r3" value="<?php echo $_POST['r3']; ?>" maxlength="5" onKeyUp="upd_res(3)" tabindex="3"> 
		</td> 
		<td class="max"> 
			/ <a href="#" onMouseUp="add_res(3);" onClick="return false;"><?php echo $market->maxcarry; ?></a> 
		</td> 
	</tr><tr> 
		<td class="ico"> 
			<a href="#" onClick="upd_res(4,1); return false;"><img class="r4" src="img/x.gif" alt="گندم" title="گندم" /></a> 
		</td> 
		<td class="nam"> 
			گندم
		</td> 
		<td class="val"> 
			<input class="text" type="text" name="r4" id="r4" value="<?php echo $_POST['r4']; ?>" maxlength="5" onKeyUp="upd_res(4)" tabindex="4"> 
		</td> 
		<td class="max"> 
			/ <a href="#" onMouseUp="add_res(4);" onClick="return false;"><?php echo $market->maxcarry; ?></a> 
		</td> 
	</tr></table> 

<div class="destination"><div class="boxes boxesColor gray"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">
<table cellpadding="0" cellspacing="0" class="transparent compact">
				<tbody>
					<tr>
						<td>
							<span>دهکده:</span>
						</td>
						<td class="compactInput">
                        	<input class="text village" type="text" name="dname" value="<?php echo $_POST['dname']; ?>" maxlength="20" tabindex="5">
						</td>
					</tr>
				</tbody>
			</table>

			<table cellpadding="0" cellspacing="0" class="transparent compact">
				<tbody>
					<tr>
						<td>
							<span class="or">یا</span>
<?php
if(isset($_GET['z'])){
$coor = $database->getCoor($_GET['z']);
}
else{
$coor['x'] = "";
$coor['y'] = "";
}
?>			<div class="coordinatesInput">
				<div class="xCoord">
					<label for="xCoordInput">X:</label>
                    <input class="text coordinates x " type="text" name="y" value="<?php echo $coor['x']; ?>" maxlength="4" tabindex="6">
				</div>
				<div class="yCoord">
					<label for="yCoordInput">Y:</label>
                    <input class="text coordinates y " type="text" name="x" value="<?php echo $coor['y']; ?>" maxlength="4" tabindex="7">
				</div>
				<div class="clear"></div>
			</div>
									<div class="clear"></div>
						</td>
					</tr>
				</tbody>
			</table>
								</div>
				</div>	</div>
<div class="clear"></div>
<p>هر يك از تاجر‌های شما، توانايی حمل <b><?php echo $market->maxcarry; ?></b> واحد منابع را دارد.</p>
<p>

<button type="submit" value="ok" name="s1" id="btn_ok" class="dynamic_img" tabindex="8"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">ارسال</div></div></button>
</p>
</form>
<?php
$error = '';
if(isset($_POST['ft'])=='check'){

	if(!$checkexist){
		$error = '<span class="error"><b>در این مختصات دهکده ای وجود ندارد.</b></span>';
    }elseif($_POST['r1']==0){
		$error = '<span class="error"><b>منابع انتخاب نشده.</b></span>';
    }elseif(!$_POST['x'] && !$_POST['y']){
		$error = '<span class="error"><b>مختصات را وارد کنید.</b></span>';
    }elseif($_POST['x']==0 && $_POST['y']==0){
		$error = '<span class="error"><b>مختصات را وارد کنید.</b></span>';
    }
    echo $error;
}
?>
<p>
<?php } ?>
<script type="text/javascript">
	window.addEvent('domready', function()
	{
		$('r1').focus();
	});
	var haendler = 4;
	var carry = <?php echo $market->maxcarry; ?>;
	var merchantRes = new Array(0,0,0,0,0);
	function add_res(resNr)
	{
		currentRes = resources['l' + resNr].value;
		merchantMax = haendler * carry;
		merchantRes[resNr] = res_max(merchantRes[resNr], currentRes , merchantMax , carry);
		$('r' + resNr).value = merchantRes[resNr];
	}
	function upd_res(resNr, max)
	{
		currentRes = resources['l' + resNr].value;
		merchantMax = haendler * carry;
		if (max)
		{
			inputRes = currentRes;
		}
		else
		{
			inputRes = parseInt($('r' + resNr).value);
		}
		if (isNaN(inputRes))
		{
			inputRes = 0;
		}
		merchantRes[resNr] = res_max(parseInt(inputRes), currentRes , merchantMax , 0);
		$('r' + resNr).value = merchantRes[resNr];
	}
	function res_max(_merchantRes, _actualRes , _merchantMax , _carry)
	{
		var res = Number(_merchantRes) + _carry;
		if (res > _actualRes)
		{
			res = _actualRes;
		}
		if (res > _merchantMax)
		{
			res = _merchantMax;
		}
		if (res == 0)
		{
			res = '';
		}
		return res;
	}
</script>
<script language="JavaScript" type="text/javascript"> 
//<!--
document.snd.r1.focus();
//-->
</script>

<?php
$timer = 1;
if(count($market->recieving) > 0) { 
echo "<h4>تاجران در حال آمدن:</h4>";
    foreach($market->recieving as $recieve) {
       echo "<table class=\"traders\" cellpadding=\"1\" cellspacing=\"1\">";
    $ownerid = $database->getVillageField($recieve['from'],"owner");
    $ownername = $database->getUserField($ownerid,"username",0);
    $sendtovil = $database->getVillage($recieve['from']);
	$villageowner = $database->getVillageField($recieve['from'],"owner");
	echo "<thead><tr><td><a href=\"spieler.php?uid=".$ownerid."\">".$ownername."</a></td>";
    echo "<td class=\"dorf\">دریافت از <a href=\"karte.php?d=".$recieve['from']."&c=".$generator->getMapCheck($recieve['from'])."\">".$sendtovil['name']."</a></td>";
    echo "</tr></thead><tbody><tr><th>زمان رسیدن</th><td>";
    echo "<div class=\"in\"><span id=timer$timer>".$generator->getTimeFormat($recieve['endtime']-time())."</span> ساعت</div>";
    $datetime = $generator->procMtime($recieve['endtime']);
    echo "<div class=\"at\">";

    echo "در ".$datetime[1]."</div>";
    echo "</td></tr></tbody> <tr class=\"res\"> <th>منابع</th> <td colspan=\"2\"><span class=\"f10\">";
    echo "<img class=\"r1\" src=\"img/x.gif\" alt=\"چوب\" title=\"چوب\" /> ".$recieve['wood']." <img class=\"r2\" src=\"img/x.gif\" alt=\"خشت\" title=\"خشت\" /> ".$recieve['clay']." <img class=\"r3\" src=\"img/x.gif\" alt=\"آهن\" title=\"آهن\" /> ".$recieve['iron']." <img class=\"r4\" src=\"img/x.gif\" alt=\"گندم\" title=\"گندم\" /> ".$recieve['crop']."</td></tr></tbody>";
    echo "</table>";
    $timer +=1;
    }
}
if(count($market->sending) > 0) {
	echo "<h4>تاجران در راه:</h4>";
    foreach($market->sending as $send) {
        $ownerid = $database->getVillageField($send['to'],"owner");
        $ownername = $database->getUserField($ownerid,"username",0);
        $sendtovil = $database->getVillage($send['to']);
        echo "<table class=\"traders\" cellpadding=\"1\" cellspacing=\"1\">";
        echo "<thead><tr> <td><a href=\"spieler.php?uid=".$ownerid."\">".$ownername."</a></td>";
        echo "<td class=\"dorf\">ارسال به <a href=\"karte.php?d=".$send['to']."&c=".$generator->getMapCheck($send['to'])."\">".$sendtovil['name']."</a></td>";
        echo "</tr></thead> <tbody><tr> <th>زمان رسیدن</th> <td>";
        echo "<div class=\"in\"><span id=timer".$timer.">".$generator->getTimeFormat($send['endtime']-time())."</span> ساعت</div>";
        $datetime = $generator->procMtime($send['endtime']);
        echo "<div class=\"at\">";

        echo "در ".$datetime[1]."</div>";
        echo "</td> </tr> <tr class=\"res\"> <th>منابع</th><td>";
        echo "<img class=\"r1\" src=\"img/x.gif\" alt=\"چوب\" title=\"چوب\" /> ".$send['wood']." <img class=\"r2\" src=\"img/x.gif\" alt=\"خشت\" title=\"خشت\" /> ".$send['clay']." <img class=\"r3\" src=\"img/x.gif\" alt=\"آهن\" title=\"آهن\" /> ".$send['iron']." <img class=\"r4\" src=\"img/x.gif\" alt=\"گندم\" title=\"گندم\" /> ".$send['crop']."</td></tr></tbody>";
        echo "</table>";
        $timer += 1;
    }
}
if(count($market->return) > 0) {
	echo "<h4>برگشت تاجران:</h4>";
    foreach($market->return as $return) {
        $villageowner = $database->getVillageField($return['from'],"owner");
        $ownername = $database->getUserField($villageowner,"username",0);
        echo "<table class=\"traders\" cellpadding=\"1\" cellspacing=\"1\">";
        echo "<thead><tr> <td></td>";
        echo "<td class=\"dorf\">برگشت از <a href=\"karte.php?d=".$return['from']."&c=".$generator->getMapCheck($return['from'])."\">$ownername</a></td>";
        echo "</tr></thead> <tbody><tr> <th>زمان رسیدن</th> <td>";
        echo "<div class=\"in\"><span id=timer".$timer.">".$generator->getTimeFormat($return['endtime']-time())."</span> ساعت</div>";
        $datetime = $generator->procMtime($return['endtime']);
        echo "<div class=\"at\">";
        if($datetime[0] != "today") {
        echo "در ".$datetime[0]." ";
        }
        echo "در ".$datetime[1]."</div>";
        echo "</td> </tr> <tr class=\"res\"> <th>منابع</th><td>";
                echo "<img class=\"r1\" src=\"img/x.gif\" alt=\"چوب\" title=\"چوب\" />".$return['wood']." | <img class=\"r2\" src=\"img/x.gif\" alt=\"خشت\" title=\"خشت\" />".$return['clay']." | <img class=\"r3\" src=\"img/x.gif\" alt=\"آهن\" title=\"آهن\" />".$return['iron']." | <img class=\"r4\" src=\"img/x.gif\" alt=\"گندم\" title=\"گندم\" />".$return['crop']."</td></tr></tbody>";

        echo "</tbody></table>";
        $timer += 1;
    }
}
?>

</p><Br /></div> 