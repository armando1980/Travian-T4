
<?php 
$fail = $success = 0;
$acares = $technology->grabAcademyRes();
for($i=22;$i<=29;$i++) {
	if($technology->meetRRequirement($i) && !$technology->getTech($i) && !$technology->isResearch($i,1)) {
    	echo "<div class=\"build_details researches\">
        <div class=\"research\">
			<div class=\"bigUnitSection\">
				<a href=\"#\" onclick=\"return Travian.Game.iPopup(".$i.",1);\">
					<img class=\"unitSection u".$i."Section\" src=\"img/x.gif\" alt=\"".$technology->getUnitName($i)."\">
				</a>
				<a href=\"#\" class=\"zoom\" onclick=\"return Travian.Game.unitZoom(".$i.");\">
					<img class=\"zoom\" src=\"img/x.gif\" alt=\"zoom in\">
				</a>
			</div>
			<div class=\"information\">
<div class=\"title\">
<a href=\"#\" onclick=\"return Travian.Game.iPopup(".$i.",1);\">
<img class=\"unit u".$i."\" src=\"img/x.gif\" alt=\"".$technology->getUnitName($i)."\"></a>
<a href=\"#\" onclick=\"return Travian.Game.iPopup(".$i.",1);\">".$technology->getUnitName($i)."</a>
</div>
<div class=\"costs\">
<div class=\"showCosts\">
                    <span class=\"resources r1 little_res\"><img class=\"r1\" src=\"img/x.gif\" alt=\"چوب\">".${'r'.$i}['wood']."</span>
                    <span class=\"resources r2 little_res\"><img class=\"r2\" src=\"img/x.gif\" alt=\"خشت\">".${'r'.$i}['clay']."</span>
                    <span class=\"resources r3 little_res\"><img class=\"r3\" src=\"img/x.gif\" alt=\"آهن\">".${'r'.$i}['iron']."</span>
                    <span class=\"resources r4 little_res\"><img class=\"r4\" src=\"img/x.gif\" alt=\"گندم\">".${'r'.$i}['crop']."</span>
                    <div class=\"clear\"></div>
                    <span class=\"clocks\"><img class=\"clock\" src=\"img/x.gif\" alt=\"duration\">";
                    echo $generator->getTimeFormat(round(${'r'.$i}['time'] * ($bid22[$village->resarray['f'.$id]]['attri'] / 100)/SPEED));
                    echo "</span>";
                    if($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) > 1) {
                   echo "<button type=\"button\" value=\"npc\" class=\"icon\" onclick=\"window.location.href = 'build.php?gid=17&t=3&r1=".${'r'.$i}['wood']."&r2=".${'r'.$i}['clay']."&r3=".${'r'.$i}['iron']."&r4=".${'r'.$i}['crop']."'; return false;\"><img src=\"img/x.gif\" class=\"npc\" alt=\"npc\"></button>
                    <div class=\"clear\"></div>";
                   }
                   if(${'r'.$i}['wood'] > $village->maxstore || ${'r'.$i}['clay'] > $village->maxstore || ${'r'.$i}['iron'] > $village->maxstore) {
                    echo "<br><div class=\"contractLink\"><span class=\"none\">انبار را ارتقا بده</span></div>
</div>
<div class=\"clear\">&nbsp;</div>
</div></div>";
echo "<div class=\"clear\">&nbsp;</div></div></div>";
                }
                else if(${'r'.$i}['crop'] > $village->maxcrop) {
                    echo "<br><div class=\"contractLink\"><span class=\"none\">انبار غذا را ارتقا بده</span></div>
</div>
<div class=\"clear\">&nbsp;</div>
</div></div>";
                    echo "<div class=\"clear\">&nbsp;</div></div></div>";
                }
                   else if(${'r'.$i}['wood'] > $village->awood || ${'r'.$i}['clay'] > $village->aclay || ${'r'.$i}['iron'] > $village->airon || ${'r'.$i}['crop'] > $village->acrop) {
                   	$time = $technology->calculateAvaliable(22,${'r'.$i});
                    echo "<br><div class=\"contractLink\"><span class=\"none\">منابع کافی ".$time[0]." در ".$time[1]."</span></div>
</div>
<div class=\"clear\">&nbsp;</div>
</div></div>";
                    echo "<div class=\"clear\">&nbsp;</div></div></div>";
                }
                else if ( $count(acares) > 0 ) {
                echo "<br><div class=\"contractLink\"><span class=\"none\">
					در حال حاضر یک تحقیق در حال انجام است</span></div></div></div>";
                }
                else {
                echo "<div class=\"contractLink\"><button type=\"button\" value=\"تحقیق\" class=\"build\" onclick=\"window.location.href = 'build.php?id=$id&amp;a=$i&amp;c=".$session->mchecker."'; return false;\">
<div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div>
<div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div>
</div><div class=\"button-contents\">تحقیق</div></div></button></div>
</div>
<div class=\"clear\">&nbsp;</div>
</div></div><div class=\"clear\">&nbsp;</div></div></div>";
                }
                $success +=1;
    }
    else {
    $fail += 1;
    }
}
if($success == 0) {
echo "<div class=\"buildActionOverview trainUnits\"><td colspan=\"2\"><div class=\"none\" align=\"center\">نیروی جدیدی برای تحقیق وجود ندارد.</div></td></div>";
}
?>		
<?php if($fail > 0) { 
	echo "<p class=\"switch\"><a class=\"openedClosedSwitch switchOpened\" id=\"researchFutureLink\" href=\"#\" onclick=\"return $('researchFuture').toggle();\">جزئیات بیشتر</a></p>
    <div id=\"researchFuture\" class=\"researches \">";
      if(!$technology->meetRRequirement(22) && !$technology->getTech(22)) {
     echo"<div class=\"research\"><div class=\"bigUnitSection\"><a href=\"#\" onclick=\"return Travian.Game.iPopup(22,1);\"><img class=\"unitSection u22Section\" src=\"img/x.gif\" alt=\"شمشیرزن\"></a><a href=\"#\" class=\"zoom\" onclick=\"return Travian.Game.unitZoom(22);\"><img class=\"zoom\" src=\"img/x.gif\" alt=\"zoom in\"></a></div><div class=\"information\"><div class=\"title\"><a href=\"#\" onclick=\"return Travian.Game.iPopup(22,1);\"><img class=\"unit u22\" src=\"img/x.gif\" alt=\"شمشیرزن\"></a><a href=\"#\" onclick=\"return Travian.Game.iPopup(22,1);\">شمشیرزن</a></div><div class=\"costs\"><div class=\"showCosts\"><span class=\"resources r1 little_res\"><img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\">".${r22}['wood']."</span><span class=\"resources r2 little_res\"><img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\">".${r22}['clay']."</span><span class=\"resources r3 little_res\"><img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\">".${r22}['iron']."</span><span class=\"resources r4 little_res\"><img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\">".${r22}['crop']."</span><div class=\"clear\"></div><span class=\"clocks\"><img class=\"clock\" src=\"img/x.gif\" alt=\"duration\">";
	 echo $generator->getTimeFormat(round(${r22}['time'] * ($bid22[$village->resarray['f'.$id]]['attri'] / 100)/SPEED));
	 echo"</span><div class=\"clear\"></div></div></div><div class=\"contractLink\"><a href=\"#\">دارالفنون</a><span class=\"level\"> سطح 3</span>, <a href=\"#\">آهنگری</a><span class=\"level\"> سطح 1</span></div></div><div class=\"clear\"></div></div><hr>";
     }
     if(!$technology->meetRRequirement(23) && !$technology->getTech(23)) {
     echo"<div class=\"research\"><div class=\"bigUnitSection\"><a href=\"#\" onclick=\"return Travian.Game.iPopup(23,1);\"><img class=\"unitSection u23Section\" src=\"img/x.gif\" alt=\"ردیاب\"></a><a href=\"#\" class=\"zoom\" onclick=\"return Travian.Game.unitZoom(23);\"><img class=\"zoom\" src=\"img/x.gif\" alt=\"zoom in\"></a></div><div class=\"information\"><div class=\"title\"><a href=\"#\" onclick=\"return Travian.Game.iPopup(23,1);\"><img class=\"unit u23\" src=\"img/x.gif\" alt=\"ردیاب\"></a><a href=\"#\" onclick=\"return Travian.Game.iPopup(23,1);\">ردیاب</a></div><div class=\"costs\"><div class=\"showCosts\"><span class=\"resources r1 little_res\"><img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\">".${r23}['wood']."</span><span class=\"resources r2 little_res\"><img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\">".${r23}['clay']."</span><span class=\"resources r3 little_res\"><img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\">".${r23}['iron']."</span><span class=\"resources r4 little_res\"><img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\">".${r23}['crop']."</span><div class=\"clear\"></div><span class=\"clocks\"><img class=\"clock\" src=\"img/x.gif\" alt=\"duration\">";
	 echo $generator->getTimeFormat(round(${r23}['time'] * ($bid22[$village->resarray['f'.$id]]['attri'] / 100)/SPEED));
	 echo"</span><div class=\"clear\"></div></div></div><div class=\"contractLink\"><a href=\"#\">دارالفنون</a><span class=\"level\"> سطح 5</span>, <a href=\"#\">اصطبل</a><span class=\"level\"> سطح 1</span></div></div><div class=\"clear\"></div></div><hr>";
     }
     if(!$technology->meetRRequirement(24) && !$technology->getTech(24)) {
     echo "<div class=\"research\"><div class=\"bigUnitSection\"><a href=\"#\" onclick=\"return Travian.Game.iPopup(24,1);\"><img class=\"unitSection u24Section\" src=\"img/x.gif\" alt=\"رعد\"></a><a href=\"#\" class=\"zoom\" onclick=\"return Travian.Game.unitZoom(24);\"><img class=\"zoom\" src=\"img/x.gif\" alt=\"zoom in\"></a></div><div class=\"information\"><div class=\"title\"><a href=\"#\" onclick=\"return Travian.Game.iPopup(24,1);\"><img class=\"unit u24\" src=\"img/x.gif\" alt=\"رعد\"></a><a href=\"#\" onclick=\"return Travian.Game.iPopup(24,1);\">رعد</a></div><div class=\"costs\"><div class=\"showCosts\"><span class=\"resources r1 little_res\"><img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\">".${r24}['wood']."</span><span class=\"resources r2 little_res\"><img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\">".${r24}['clay']."</span><span class=\"resources r3 little_res\"><img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\">".${r24}['iron']."</span><span class=\"resources r4 little_res\"><img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\">".${r24}['crop']."</span><div class=\"clear\"></div><span class=\"clocks\"><img class=\"clock\" src=\"img/x.gif\" alt=\"duration\">";
	 echo $generator->getTimeFormat(round(${r24}['time'] * ($bid22[$village->resarray['f'.$id]]['attri'] / 100)/SPEED));
	 echo"</span><div class=\"clear\"></div></div></div><div class=\"contractLink\"><a href=\"#\">دارالفنون</a><span class=\"level\"> سطح 5</span>, <a href=\"#\">اصطبل</a><span class=\"level\"> سطح 3</span></div></div><div class=\"clear\"></div></div><hr>";
     }
     if(!$technology->meetRRequirement(25) && !$technology->getTech(25)) {
     echo "<div class=\"research\"><div class=\"bigUnitSection\"><a href=\"#\" onclick=\"return Travian.Game.iPopup(25,1);\"><img class=\"unitSection u25Section\" src=\"img/x.gif\" alt=\"کاهن سواره\"></a><a href=\"#\" class=\"zoom\" onclick=\"return Travian.Game.unitZoom(25);\"><img class=\"zoom\" src=\"img/x.gif\" alt=\"zoom in\"></a></div><div class=\"information\"><div class=\"title\"><a href=\"#\" onclick=\"return Travian.Game.iPopup(25,1);\"><img class=\"unit u25\" src=\"img/x.gif\" alt=\"کاهن سواره\"></a><a href=\"#\" onclick=\"return Travian.Game.iPopup(25,1);\">کاهن سواره</a></div><div class=\"costs\"><div class=\"showCosts\"><span class=\"resources r1 little_res\"><img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\">".${r25}['wood']."</span><span class=\"resources r2 little_res\"><img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\">".${r25}['clay']."</span><span class=\"resources r3 little_res\"><img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\">".${r25}['iron']."</span><span class=\"resources r4 little_res\"><img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\">".${r25}['crop']."</span><div class=\"clear\"></div><span class=\"clocks\"><img class=\"clock\" src=\"img/x.gif\" alt=\"duration\">";
	 echo $generator->getTimeFormat(round(${r25}['time'] * ($bid22[$village->resarray['f'.$id]]['attri'] / 100)/SPEED));
	 echo"</span><div class=\"clear\"></div></div></div><div class=\"contractLink\"><a href=\"#\">دارالفنون</a><span class=\"level\"> سطح 5</span>, <a href=\"#\">اصطبل</a><span class=\"level\"> سطح 5</span></div></div><div class=\"clear\"></div></div><hr>";
     }
     if(!$technology->meetRRequirement(26) && !$technology->getTech(26)) {
     echo "<div class=\"research\"><div class=\"bigUnitSection\"><a href=\"#\" onclick=\"return Travian.Game.iPopup(26,1);\"><img class=\"unitSection u26Section\" src=\"img/x.gif\" alt=\"شوالیه گول\"></a><a href=\"#\" class=\"zoom\" onclick=\"return Travian.Game.unitZoom(26);\"><img class=\"zoom\" src=\"img/x.gif\" alt=\"zoom in\"></a></div><div class=\"information\"><div class=\"title\"><a href=\"#\" onclick=\"return Travian.Game.iPopup(26,1);\"><img class=\"unit u26\" src=\"img/x.gif\" alt=\"شوالیه گول\"></a><a href=\"#\" onclick=\"return Travian.Game.iPopup(26,1);\">شوالیه گول</a></div><div class=\"costs\"><div class=\"showCosts\"><span class=\"resources r1 little_res\"><img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\">".${r26}['wood']."</span><span class=\"resources r2 little_res\"><img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\">".${r26}['clay']."</span><span class=\"resources r3 little_res\"><img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\">".${r26}['iron']."</span><span class=\"resources r4 little_res\"><img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\">".${r26}['crop']."</span><div class=\"clear\"></div><span class=\"clocks\"><img class=\"clock\" src=\"img/x.gif\" alt=\"duration\">";
	 echo $generator->getTimeFormat(round(${r26}['time'] * ($bid22[$village->resarray['f'.$id]]['attri'] / 100)/SPEED));
	 echo"</span><div class=\"clear\"></div></div></div><div class=\"contractLink\"><a href=\"#\">دارالفنون</a><span class=\"level\"> سطح 15</span>, <a href=\"#\">اصطبل</a><span class=\"level\"> سطح 10</span></div></div><div class=\"clear\"></div></div><hr>";
     }
     if(!$technology->meetRRequirement(27) && !$technology->getTech(27)) {
     echo "<div class=\"research\"><div class=\"bigUnitSection\"><a href=\"#\" onclick=\"return Travian.Game.iPopup(27,1);\"><img class=\"unitSection u27Section\" src=\"img/x.gif\" alt=\"دژکوب\"></a><a href=\"#\" class=\"zoom\" onclick=\"return Travian.Game.unitZoom(27);\"><img class=\"zoom\" src=\"img/x.gif\" alt=\"zoom in\"></a></div><div class=\"information\"><div class=\"title\"><a href=\"#\" onclick=\"return Travian.Game.iPopup(27,1);\"><img class=\"unit u27\" src=\"img/x.gif\" alt=\"دژکوب\"></a><a href=\"#\" onclick=\"return Travian.Game.iPopup(27,1);\">دژکوب</a></div><div class=\"costs\"><div class=\"showCosts\"><span class=\"resources r1 little_res\"><img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\">".${r27}['wood']."</span><span class=\"resources r2 little_res\"><img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\">".${r27}['clay']."</span><span class=\"resources r3 little_res\"><img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\">".${r27}['iron']."</span><span class=\"resources r4 little_res\"><img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\">".${r27}['crop']."</span><div class=\"clear\"></div><span class=\"clocks\"><img class=\"clock\" src=\"img/x.gif\" alt=\"duration\">";
	 echo $generator->getTimeFormat(round(${r27}['time'] * ($bid22[$village->resarray['f'.$id]]['attri'] / 100)/SPEED));
	 echo"</span><div class=\"clear\"></div></div></div><div class=\"contractLink\"><a href=\"#\">دارالفنون</a><span class=\"level\"> سطح 10</span>, <a href=\"#\">کارگاه</a><span class=\"level\"> سطح 1</span></div></div><div class=\"clear\"></div></div><hr>";
     }
     if(!$technology->meetRRequirement(28) && !$technology->getTech(28)) {
     echo "<div class=\"research\"><div class=\"bigUnitSection\"><a href=\"#\" onclick=\"return Travian.Game.iPopup(28,1);\"><img class=\"unitSection u28Section\" src=\"img/x.gif\" alt=\"منجنیق\"></a><a href=\"#\" class=\"zoom\" onclick=\"return Travian.Game.unitZoom(28);\"><img class=\"zoom\" src=\"img/x.gif\" alt=\"zoom in\"></a></div><div class=\"information\"><div class=\"title\"><a href=\"#\" onclick=\"return Travian.Game.iPopup(28,1);\"><img class=\"unit u28\" src=\"img/x.gif\" alt=\"منجنیق\"></a><a href=\"#\" onclick=\"return Travian.Game.iPopup(28,1);\">منجنیق</a></div><div class=\"costs\"><div class=\"showCosts\"><span class=\"resources r1 little_res\"><img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\">".${r28}['wood']."</span><span class=\"resources r2 little_res\"><img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\">".${r28}['clay']."</span><span class=\"resources r3 little_res\"><img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\">".${r28}['iron']."</span><span class=\"resources r4 little_res\"><img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\">".${r28}['crop']."</span><div class=\"clear\"></div><span class=\"clocks\"><img class=\"clock\" src=\"img/x.gif\" alt=\"duration\">";
	 echo $generator->getTimeFormat(round(${r28}['time'] * ($bid22[$village->resarray['f'.$id]]['attri'] / 100)/SPEED));
	 echo"</span><div class=\"clear\"></div></div></div><div class=\"contractLink\"><a href=\"#\">دارالفنون</a><span class=\"level\"> سطح 15</span>, <a href=\"#\">کارگاه</a><span class=\"level\"> سطح 10</span></div></div><div class=\"clear\"></div></div><hr>";
     }
     if(!$technology->meetRRequirement(29) && !$technology->getTech(29)) {
     echo "<div class=\"research\"><div class=\"bigUnitSection\"><a href=\"#\" onclick=\"return Travian.Game.iPopup(29,1);\"><img class=\"unitSection u29Section\" src=\"img/x.gif\" alt=\"رئیس قبیله\"></a><a href=\"#\" class=\"zoom\" onclick=\"return Travian.Game.unitZoom(29);\"><img class=\"zoom\" src=\"img/x.gif\" alt=\"zoom in\"></a></div><div class=\"information\"><div class=\"title\"><a href=\"#\" onclick=\"return Travian.Game.iPopup(29,1);\"><img class=\"unit u29\" src=\"img/x.gif\" alt=\"رئیس قبیله\"></a><a href=\"#\" onclick=\"return Travian.Game.iPopup(29,1);\">رئیس قبیله</a></div><div class=\"costs\"><div class=\"showCosts\"><span class=\"resources r1 little_res\"><img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\">".${r29}['wood']."</span><span class=\"resources r2 little_res\"><img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\">".${r29}['clay']."</span><span class=\"resources r3 little_res\"><img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\">".${r29}['iron']."</span><span class=\"resources r4 little_res\"><img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\">".${r29}['crop']."</span><div class=\"clear\"></div><span class=\"clocks\"><img class=\"clock\" src=\"img/x.gif\" alt=\"duration\">";
	 echo $generator->getTimeFormat(round(${r29}['time'] * ($bid22[$village->resarray['f'.$id]]['attri'] / 100)/SPEED));
	 echo"</span><div class=\"clear\"></div></div></div><div class=\"contractLink\"><a href=\"#\">دارالفنون</a><span class=\"level\"> سطح 20</span>, <a href=\"#\">اردوگاه</a><span class=\"level\"> سطح 10</span></div></div><div class=\"clear\"></div></div>";
     }
?>
<script type="text/javascript">
		//<![CDATA[
			$("researchFuture").toggle = (function()
			{
				this.toggleClass("hide");

				$("researchFutureLink").set("text",
					this.hasClass("hide")
					?	"جزئیات بیشتر"
					:	"عدم نمایش جزئیات"
				);

				return false;
			}).bind($("researchFuture"));
		//]]>
</script>
<?php
     echo "<div class=\"clear\"></div></div>";
}

if(count($acares) > 0) {
	echo "<table cellpadding=\"1\" cellspacing=\"1\" class=\"under_progress\"><thead><tr><td>در حال پیشرفت</td><td>مدت زمان</td><td>اتمام</td></tr>
	</thead><tbody>";
			$timer = 1;
	foreach($acares as $aca) {
		$unit = substr($aca['tech'],1,2);
		echo "<tr><td class=\"desc\"><img class=\"unit u$unit\" src=\"img/x.gif\" alt=\"".$technology->getUnitName($unit)."\" title=\"".$technology->getUnitName($unit)."\" />".$technology->getUnitName($unit)."</td>";
			echo "<td class=\"dur\"><span id=\"timer$timer\">".$generator->getTimeFormat($aca['timestamp']-time())."</span></td>";
			$date = $generator->procMtime($aca['timestamp']);
		    echo "<td class=\"fin\"><span>".$date[1]."</span><span> ساعت</span></td>";
		echo "</tr>";
		$timer +=1;
	}
	echo "</tbody></table></div></div><div class=\"clear\"></div>";
}
?>
