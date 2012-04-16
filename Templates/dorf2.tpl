<?php 
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       dorf2.tpl                                                   ##
##  Developed by:  Dzoki                                                       ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
##                                                                             ##
#################################################################################
?>
<div id="village_map">
<?php
if($building->walling()) {
	$wtitle = $building->procResType($building->walling())." سطح ".$village->resarray['f40'];
}
else {
	$wtitle = ($village->resarray['f40'] == 0)? "محل احداث، خارج شهر" : $building->procResType($village->resarray['f40t'],0)." سطح ".$village->resarray['f40'];
}
?>
<map name="clickareas" id="clickareas">
<?php
$coords = array(19=>"518,135,496,120,496,121,468,122,449,136,449,151,470,163,500,163,519,149",
"426,53,405,39,405,39,377,40,357,55,357,110,379,121,408,121,428,108",
"338,36,317,21,317,22,289,23,269,37,269,92,291,104,320,104,339,91",
"244,65,222,51,222,51,194,52,175,67,175,121,196,133,226,133,245,120",
"170,107,149,93,149,94,121,95,101,109,101,164,123,176,152,176,172,162",
"557,184,536,170,536,171,508,172,488,186,489,201,510,213,540,213,559,199",
"112,156,90,142,90,142,62,144,43,158,43,213,65,224,94,224,113,211",
"348,113,327,98,327,99,299,100,279,114,280,169,301,181,330,181,350,168",
"531,320,510,306,510,307,482,308,462,322,463,337,484,349,514,349,533,335",
"569,244,548,230,548,230,520,231,500,246,500,260,522,272,551,272,571,259",
"151,249,130,235,130,235,102,236,82,251,83,265,104,277,134,277,153,264",
"447,259,426,245,426,245,398,246,378,261,378,275,400,287,429,287,448,274",
"446,189,425,175,425,175,397,176,377,190,377,205,399,217,428,217,447,204",
"374,268,352,254,352,254,324,255,304,270,305,324,326,336,356,336,375,323",
"123,317,102,303,102,303,74,304,54,319,55,333,76,345,106,345,125,332",
"446,379,424,365,424,365,396,366,377,380,377,395,398,407,428,407,447,394",
"304,370,283,356,283,357,255,358,235,372,236,387,257,398,287,398,306,385",
"195,334,174,320,174,321,146,322,126,336,126,351,148,362,177,362,196,349",
"357,412,336,398,336,399,308,400,288,414,289,429,310,440,339,440,359,427",
"232,396,211,381,211,382,183,383,163,397,164,412,185,424,215,424,234,410",
"230,212,216,250,259,301,234,323,183,286,175,233,201,183",
"557,450,626,374,625,374,638,243,615,142,508,81,414,34,288,18,128,43,13,130,-13,239,-15,350,27,425,94,494,270,534,346,532,448,526,551,456,511,378,465,413,386,442,297,454,203,443,129,417,52,344,32,304,30,221,57,157,147,90,243,61,315,56,411,72,493,113,551,165,582,217,584,269,563,326,509,379");
for($t=19;$t<=40;$t++) {
	if(($village->resarray['f99t'] == 40 AND ($t)=='26') or ($village->resarray['f99t'] == 40 AND ($t)=='30') or ($village->resarray['f99t'] == 40 AND ($t)=='31') or ($village->resarray['f99t'] == 40 AND ($t)=='32')) {
	echo "<area href=\"build.php?id=99\" title=\"<div style=color:#FFF><b>شگفتی جهان</b></div> سطح ".$village->resarray['f99']."\" coords=\"$coords[$t]\" shape=\"poly\"/>";
	} else {
if($village->resarray['f'.$t.'t'] != 0) {
$title = "<div style=color:#FFF><b>".$building->procResType($village->resarray['f'.$t.'t'])."</b></div> سطح ".$village->resarray['f'.$t];
}
else {
    $title = "محل احداث ساختمان";
    if(($t == 39) && ($village->resarray['f'.$t] == 0)) {
        $title = "محل احداث اردوگاه";
        }
}
	echo "<area href=\"build.php?id=$t\" alt= \"$title\" title=\"$title\" coords=\"$coords[$t]\" shape=\"poly\"/>";
}
}
?>
<?php
 if($village->resarray['f40'] == 0) { 
if($building->walling()) {
    $wtitle = $building->procResType($building->walling())." سطح ".$village->resarray['f40'];
    echo "<img src=\"img/x.gif\" class=\"wall g3".$session->tribe."Top \" alt=\"$wtitle level ".$village->resarray['f40']."\">";
     echo "<img src=\"img/x.gif\" class=\"wall g3".$session->tribe."bBottom \" alt=\"$wtitle level ".$village->resarray['f40']."\">";

    }
}else {
          $wtitle = $building->procResType($building->walling())." سطح ".$village->resarray['f40'];
    echo "<img src=\"img/x.gif\" class=\"wall g3".$session->tribe."Top \" alt=\"$wtitle level ".$village->resarray['f40']."\">";
    echo "<img src=\"img/x.gif\" class=\"wall g3".$session->tribe."Bottom \" alt=\"$wtitle level ".$village->resarray['f40']."\">";
}
?>
</map>

<?php
for ($i=1;$i<=20;$i++) {
	if(($village->resarray['f99t'] == 40 AND ($i+18)=='26') or ($village->resarray['f99t'] == 40 AND ($i+18)=='30') or ($village->resarray['f99t'] == 40 AND ($i+18)=='31') or ($village->resarray['f99t'] == 40 AND ($i+18)=='32')) {
		} else {
	$text = "محل احداث ساختمان";
	$img = "iso";
    	if($village->resarray['f'.($i+18).'t'] != 0) {
        	$text = $building->procResType($village->resarray['f'.($i+18).'t'])." سطح ".$village->resarray['f'.($i+18)];
            $img = "g".$village->resarray['f'.($i+18).'t'];
       }
    foreach($building->buildArray as $job) {
    	if($job['field'] == ($i+18)) {
        	$img = 'g'.$job['type'].'b';
            $text = $building->procResType($job['type'])." سطح ".$village->resarray['f'.$job['field']];
        }
    }
	echo "<img src=\"img/x.gif\" class=\"building d$i $img\" alt=\"$text\" />";
	}
}
    if($village->resarray['f39'] == 0) {
            if($building->rallying()) {
            echo "<img src=\"img/x.gif\" class=\"dx1 g16b\" alt=\"اردوگاه سطح ".$village->resarray['f39']."\" />";
            }
            else {
            echo "<img src=\"img/x.gif\" class=\"dx1 g16e\" alt=\"جایگاه ساخت اردوگاه\" />";
            }
        }
      else {
      	echo "<img src=\"img/x.gif\" class=\"dx1 g16\" alt=\"اردوگاه سطح ".$village->resarray['f39']."\" />";
      }
?>
<?php
if($village->resarray['f99t'] == 40) {
if($village->resarray['f99'] >= 0 && $village->resarray['f99'] <= 19) {
echo '<img class="ww g40" src="img/x.gif" alt="شگفتی جهان">'; }
if($village->resarray['f99'] >= 20 && $village->resarray['f99'] <= 39) {
echo '<img class="ww g40_1" src="img/x.gif" alt="شگفتی جهان">'; }
if($village->resarray['f99'] >= 40 && $village->resarray['f99'] <= 59) {
echo '<img class="ww g40_2" src="img/x.gif" alt="شگفتی جهان">'; }
if($village->resarray['f99'] >= 60 && $village->resarray['f99'] <= 79) {
echo '<img class="ww g40_3" src="img/x.gif" alt="شگفتی جهان">'; }
if($village->resarray['f99'] >= 80 && $village->resarray['f99'] <= 89) {
echo '<img class="ww g40_4" src="img/x.gif" alt="شگفتی جهان">'; }
if($village->resarray['f99'] >= 90 && $village->resarray['f99'] <= 100) {
echo '<img class="ww g40_5" src="img/x.gif" alt="شگفتی جهان">'; }
}
?>
    <div id="levels" <?php if(isset($_COOKIE['t4level'])) { echo "class=\"on\""; } ?>>
<?php
for($i=1;$i<=20;$i++) {
if ($village->resarray['f'.($i+18)] != 0) {
echo "<div class=\"l$i\">".$village->resarray['f'.($i+18)]."</div>";
}
}
if($village->resarray['f39'] != 0) {
echo "<div class=\"l39\">".$village->resarray['f39']."</div>";
}
if($village->resarray['f40'] != 0) {
echo "<div class=\"aid40\">".$village->resarray['f40']."</div>";

}
?>

		</div>
        
<img src="img/x.gif" id="lswitch" <?php if(isset($_COOKIE['t4level'])) { echo "class=\"lswitchMinus\""; }else{ echo "class=\"lswitchPlus\""; } ?> onclick=" 
				$('lswitch').toggleClass('lswitchMinus');
				$('lswitch').toggleClass('lswitchPlus');
				if ($('levels').toggleClass('on').hasClass('on'))
				{
					document.cookie = 't4level=1; expires=Wed, 1 Jan 2020 00:00:00 GMT';
				}
				else
				{
					document.cookie = 't4level=1; expires=Thu, 01-Jan-1970 00:00:01 GMT';
				}
			" />
	<img class="clickareas" usemap="#clickareas" src="img/x.gif" alt="" />
            </div><div class="clear">&nbsp;</div>
            
           