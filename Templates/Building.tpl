
<div class="boxes buildingList">
<div class="boxes-tl"></div>
<div class="boxes-tr"></div>
<div class="boxes-tc"></div>
<div class="boxes-ml"></div>
<div class="boxes-mr"></div>
<div class="boxes-mc"></div>
<div class="boxes-bl"></div>
<div class="boxes-br"></div>
<div class="boxes-bc"></div>
<div class="boxes-contents">
			<table cellpadding="1" cellspacing="1" id="building_contract">
				<thead>
					<tr>
						<th colspan="4"><?php echo BUILDING_UPGRADING;?>
			<?php if($session->gold >= 2) { ?> 
            <div class="finishNow"><a class="arrow" href="?cmd=buildingFinish" onclick="return confirm('تمامی ساخت ها و تحقیقات در این دهکده را با 2 سکۀ طلای تراوین به پایان برسان؟');">اتمام سریع ساخت </a>
             (هزینه: <img src="img/x.gif" class="gold" alt="سکۀ طلای تراوین"> <b>2</b> )</div>
		<?php
            }
            ?></th>
		</tr></thead>
		<tbody>
        <?php 
        if($_GET['buildingFinish'] == 1 AND $session->gold >= 2) {
        	$gold=$database->getUserField($_SESSION['username'],'gold','username');
		      $gold-=2;
		      $database->updateUserField($_SESSION['username'],'gold',$gold,0);
        }
        
        if(!isset($timer)) {
        $timer = 1;
        }
        foreach($building->buildArray as $jobs) {
        	echo "<tr><td class=\"ico\"><a href=\"?d=".$jobs['id']."&a=0&c=$session->checker\">";
            echo "<img src=\"img/x.gif\" class=\"del\" title=\"لغو\" alt=\"لغو\" /></a></td><td>";
			echo $building->procResType($jobs['type'])." <span class=\"lvl\">سطح ".($village->resarray['f'.$jobs['field']]+($jobs['field']==$BuildFirst?2:1 ))."</span>";
			if($jobs['loopcon'] == 0) { $BuildFirst = $jobs['field']; }
            if($jobs['loopcon'] == 1) {
            	echo "";
            }
            echo "</td><td colspan=\"2\" class=\"buildingTime\"><span id=\"timer".$timer."\">";
            echo $generator->getTimeFormat($jobs['timestamp']-time());
            echo "</span> ساعت. ";
            echo "زمان تکمیل ".date('H:i', $jobs['timestamp'])."</td></tr>";
            $timer +=1;
      	}
        ?>
            </tbody>
	</table>
        </div> 
				</div>

	<script type="text/javascript">var bld=[{"stufe":1,"gid":"1","aid":"3"}]</script>
