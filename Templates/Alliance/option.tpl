<?php
if(isset($aid)) {
$aid = $aid;
}
else {
$aid = $session->alliance;
}
$allianceinfo = $database->getAlliance($aid);
echo "<h1>اتحاد - ".$allianceinfo['tag']."</h1>";
include("alli_menu.tpl"); 
?>
<h4 class="round">اقدامات</h4>
<form method="POST" action="allianz.php">
<input type="hidden" name="s" value="5">
<ul class="options">

<?php
if ($alliance->userPermArray['opt3']==1){
?>        
		<label><li><input class="radio" type="radio" name="o" value="100"> تغییر نام</li></label>
<?php
}
if ($alliance->userPermArray['opt3']==1){
?>        

		<label><li><input class="radio" type="radio" name="o" value="3"> تغییر توضیحات اتحاد</li></label>
<?php
}
if ($alliance->userPermArray['opt1']==1){
?>		
        <label><li><input class="radio" type="radio" name="o" value="1"> اعطای مقام</li></label>
<?php
} 
if ($alliance->userPermArray['opt4']==1){
?>        
		<label><li><input class="radio" type="radio" name="o" value="4"> دعوت یک بازیکن به اتحاد</li></label>
<?php
}
if ($alliance->userPermArray['opt6']==1){
?>         
		<label><li><input class="radio" type="radio" name="o" value="6"> سیاست اتحاد</li></label>
<?php
}
if ($alliance->userPermArray['opt2']==1){
?>        
		<label><li><input class="radio" type="radio" name="o" value="2"> اخراج بازیکن</li></label>

<?php
}
?>                
		<label><li><input class="radio" type="radio" name="o" value="11"> خروج از اتحاد</li></label>
        
</ul>

	<p><button type="submit" value="ok" name="s1" id="btn_ok"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">تایید</div></div></button></p></form>