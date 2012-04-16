<div id="build" class="gid29"><a href="#" onClick="return Popup(29,4);" class="build_logo">
    <img class="building g29" src="img/x.gif" alt="پادگان بزرگ" title="پادگان بزرگ" />
</a>
<h1>پادگان بزرگ <span class="level">سطح <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">در سربازخانه بزرگ شما می توانید سربازها را بطور همزمان با سرباز خانه و با سه برابر هزینه عادی تربیت کنید.</p>

<?php if ($building->getTypeLevel(29) > 0) { ?>
<form method="POST" name="snd" action="build.php">
                <input type="hidden" name="id" value="<?php echo $id; ?>" />
                <input type="hidden" name="ft" value="t3" />
                <table cellpadding="1" cellspacing="1" class="build_details">
                <thead><tr>
                    <td>نام</td>
                    <td>تعداد</td>
                    <td>ماکزیمم</td>
                </tr></thead><tbody>
                <?php
                    include("29_train.tpl");
                ?></table>
    <p><input type="image" id="btn_train" class="dynamic_img" value="ok" name="s1" src="img/x.gif" alt="train" /></form></p>
    <?php
    } else {
        echo "<b>Training can commence when great barracks are completed.</b><br>\n";
    }
    $trainlist = $technology->getTrainingList(5);
    if(count($trainlist) > 0) {
        echo "
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
            if ($TrainCount == 1 ) {
                $NextFinished = $generator->getTimeFormat(($train['commence']+$train['eachtime'])-time());
                echo "<span id=timer1>".$generator->getTimeFormat(($train['commence']+($train['eachtime']*$train['amt']))-time())."</span>";
            } else {
                echo $generator->getTimeFormat($train['eachtime']*$train['amt']);
            }
            echo "</td><td class=\"fin\">";
            $time = $generator->procMTime($train['commence']+($train['eachtime']*$train['amt']));
			echo " ".$time[1]." ساعت";
        } ?>
		</tr><tr class="next"><td colspan="3">سرباز بعدی تا <span id="timer2"><?php echo $NextFinished; ?></span> دقیقه آماده خواهد شد</td></tr>
        </tbody></table>
    <?php }
include("upgrade.tpl");
?>
</p></div>