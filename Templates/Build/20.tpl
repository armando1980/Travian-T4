<h1 class="titleInHeader">اصطبل <span class="level">سطح <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid20">
<p class="build_desc">
<a href="#" onClick="return Travian.Game.iPopup(20,4);" class="build_logo">
<img class="building big white g20" src="img/x.gif" alt="اصطبل" title="اصطبل" /> </a>
در اصطبل سواره نظام ها تربیت می شوند. هر قدر سطح این ساختمان بالاتر باشد نیروها سریعتر آماده خواهند شد.<br /></p>

<?php 
include("upgrade.tpl");
if ($building->getTypeLevel(20) > 0) { ?>
<div class="clear"></div>
		<form method="POST" name="snd" action="build.php">
			<input type="hidden" name="id" value="<?php echo $id; ?>" />
            <input type="hidden" name="ft" value="t1" />

                <div class="buildActionOverview trainUnits">
                <?php 
                include("20_".$session->tribe.".tpl");
                ?>
                </div>
			<div class="clear"></div>
				    <button type="submit" value="ok" name="s1" id="btn_train" value="ok" class="startTraining">
                    <div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">تربیت</div></div>
                    </button>

		</form>
<?php
	} else {
		echo "<b>Training can commence when stables are completed.</b><br>\n";
	}
    $trainlist = $technology->getTrainingList(2);
    if(count($trainlist) > 0) {
    //$timer = 2*count($trainlist);
    	echo "
        <h4 class=\"round spacer\">در حال تربیت</h4>
    <table cellpadding=\"1\" cellspacing=\"1\" class=\"under_progress\">
		<thead><tr>
			<td>در حال آماده سازی</td>
			<td>زمان</td>
			<td>اتمام</td>
		</tr></thead>
		<tbody>";
		$TrainCount = 0;
        foreach($trainlist as $train) {
			$TrainCount++;
			echo "<tr><td class=\"desc\">";
			echo "<img class=\"unit u".$train['unit']."\" src=\"img/x.gif\" alt=\"".$train['name']."\" title=\"".$train['name']."\" />";
			echo $train['amt']." ".$train['name']."</td><td class=\"dur\">";
			if ($TrainCount == 1) {
				$NextFinished = $generator->getTimeFormat(($train['commence']+$train['eachtime'])-time());
				echo "<span id=timer1>".$generator->getTimeFormat(($train['commence']+($train['eachtime']*$train['amt']))-time())."</span>";
			} else {
				echo $generator->getTimeFormat($train['eachtime']*$train['amt']);
			}
			echo "</span></td><td class=\"fin\">";
			$time = $generator->procMTime($train['commence']+($train['eachtime']*$train['amt']));
			echo " ".$time[1]." ساعت";
		} ?>
		</tr><tr class="next"><td colspan="3">سرباز بعدی تا <span id="timer2"><?php echo $NextFinished; ?></span> دقیقه آماده خواهد شد</td></tr>
        </tbody></table>
    <?php }
    ?> </p></div>
<div class="clear">&nbsp;</div>
    <div class="clear"></div>