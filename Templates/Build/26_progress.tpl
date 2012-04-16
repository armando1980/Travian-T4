 <?php
    $trainlist = $technology->getTrainingList(4);
    if(count($trainlist) > 0) {
    	echo "
    <br /><table cellpadding=\"1\" cellspacing=\"1\" class=\"under_progress\">
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
?>
