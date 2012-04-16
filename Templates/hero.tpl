<?php 
$hero = $database->getHeroData($session->uid);
$herodetail = $database->HeroFace($session->uid);
$tribe = $session->tribe;
$hero_t = $GLOBALS["hero_t".$tribe];
if($hero['points'] > 0){ $pStyle = ""; }else { $pStyle = " hidden"; }
$plevel = $hero['level']-1;
$heroWrefC = $generator->getMapCheck($hero['wref']);
if($tribe == 1){ $tp = 100; }else{ $tp = 80; }
$rp = 30;

?>
<div id="attributes"><div class="boxes boxesColor gray"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">
    	<div class="attribute headline">
			<div class="attributesHeadline">خصوصیات</div>
			<div class="pointsHeadline">امتیازها</div>
			<div class="clear"></div>
		</div>
		<div class="clear"></div>
  <div class="attribute power tooltip" title="قدرت هجومی||قدرت هجومی قهرمان ترکیبی از قدرت حمله و دفاع او می‌باشد. به هر اندازه که قدرت هجومی قهرمان بیشتر باشد به همان اندازه صدمه کمتری در ماجراجویی‌های خود خواهد دید.<br><font color='#5dcbfb'>قدرت هجومی: <?php echo $hero['power']; ?> از قهرمان</font>">
			<div class="element attribName">قدرت هجومی</div>
			<div class="element current power"><?php echo $hero['power']; ?></div>
            <?php
            if($hero['power']<=1800){
            	$ppp = 20;
            }else{
            	$ppp = (10+(($hero['power']-100)/100));
            }
                $powerBar = round((($hero['power']-100)/$ppp), 1);
            ?>
			<div class="element progress">
				<div class="bar-bg">
					<div class="bar" style="width:<?php echo $powerBar; ?>%;"></div>
				</div>
			</div>
			<div class="element add">
        <a class="setPoint<?php echo $pStyle; ?>" href="?add=power&a=<?php echo $plevel; ?>&c=<?php echo $heroWrefC; ?>"></a>
			</div>
			<div class="element points"><?php echo intval($hero['power']/$tp)-1; ?></div>
		</div>

		<div class="clear"></div>
  <div class="attribute offBonus tooltip" title="امتیاز هجومی||باعث افزایش قدرت هجومی تمامی لشکریانی خواهد شد که همراه قهرمان می‌باشند.<br><font color='#5dcbfb'>امتیاز هجومی: <?php echo ($hero['offBonus']/200); ?>%</font>">
			<div class="element attribName">امتیاز هجومی</div>
			<div class="element current power"><span class="value"><?php echo ($hero['offBonus']/200); ?></span>%</div>
			<div class="element progress">
				<div class="bar-bg">
					<div class="bar" style="width:<?php echo intval($hero['offBonus']/$tp); ?>%;"></div>
				</div>
			</div>
			<div class="element add">
            <a class="setPoint<?php echo $pStyle; ?>" href="?add=offBonus&a=<?php echo $plevel; ?>&c=<?php echo $heroWrefC; ?>"></a>
			</div>
			<div class="element points"><?php echo intval($hero['offBonus']/$tp); ?></div>
		</div>

		<div class="clear"></div>

  <div class="attribute defBonus tooltip" title="امتیاز دفاعی||باعث افزایش قدرت دفاعی تمامی لشکریانی خواهد شد که همراه قهرمان می‌باشند.<br><font color='#5dcbfb'>امتیاز دفاعی: <?php echo ($hero['defBonus']/200); ?>%</font>">
			<div class="element attribName">امتیاز دفاعی</div>
			<div class="element current power"><span class="value"><?php echo ($hero['defBonus']/200); ?></span>%</div>
			<div class="element progress">
				<div class="bar-bg">
					<div class="bar" style="width:<?php echo intval($hero['defBonus']/$tp); ?>%;"></div>
				</div>
			</div>
			<div class="element add">
            <a class="setPoint<?php echo $pStyle; ?>" href="?add=defBonus&a=<?php echo $plevel; ?>&c=<?php echo $heroWrefC; ?>"></a>
			</div>
			<div class="element points"><?php echo intval($hero['defBonus']/$tp); ?></div>
		</div>

		<div class="clear"></div>

  <div class="attribute productionPoints tooltip" title="منابع||باعث افزایش تولید منابع دهکده‌ای خواهد شد که قهرمان در حال حاضر در آن مقیم است.
<br><font color='#5dcbfb'>افزایش تولید منابع: <?php echo intval($hero['product']); ?> منبع</font>">
			<div class="element attribName">منابع</div>
			<div class="element current power"><?php echo intval($hero['product']/$rp); ?></div>
			<div class="element progress">
				<div class="bar-bg">
					<div class="bar" style="width:<?php if(min(100,$hero['product']/$rp) < 50){ echo min(100,$hero['product']/$rp)*2; }else{ echo min(100,$hero['product']/$rp); } ?>%;"></div>
                   
				</div>
			</div>
			<div class="element add">
             <a class="setPoint<?php echo $pStyle; ?>" href="?add=productionPoints&a=<?php echo $plevel; ?>&c=<?php echo $heroWrefC; ?>"></a>
			</div>
			<div class="element points"><?php echo intval($hero['product']/$rp); ?></div>
		</div>

		<div class="clear"></div>
		</div>
  </div>
	<div class="boxes boxesColor gray"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">
    <div class="attribute res" id="setResource">
		<div class="changeResourcesHeadline">تغییر نوع تولید منابع از طرف قهرمان</div>
		<div class="clear"></div>
		<div class="resource">
		  <input type="radio" onclick="window.location.href = '?product=r0';" name="resource" value="0" id="resourceHero0" <?php if($hero['r0']!=0){ echo $checked="checked"; } ?>>
			<label for="resourceHero0">
				<img title="تمامی منابع" class="r0" src="img/x.gif">
                <span class="current"> <?php echo $hero['product']/4; ?></span>
			</label>
		</div>
				<div class="resource">
			<input type="radio" onclick="window.location.href = '?product=r1';" name="resource" value="1" id="resourceHero1" <?php if($hero['r1']!=0){ echo $checked="checked"; } ?> <?php echo $form->getRadio('resource',1); ?>>
			<label for="resourceHero1">
				<img title="چوب" class="r1" src="img/x.gif">
                <span class="current"> <?php echo $hero['product']; ?></span>
			</label>
		</div>
				<div class="resource">
			<input type="radio" onclick="window.location.href = '?product=r2';" name="resource" value="2" id="resourceHero2" <?php if($hero['r2']!=0){ echo $checked="checked"; } ?> <?php echo $form->getRadio('resource',2); ?>>
			<label for="resourceHero2">
				<img title="خشت" class="r2" src="img/x.gif">
                <span class="current"> <?php echo $hero['product']; ?></span>
			</label>
		</div>
				<div class="resource">
			<input type="radio" onclick="window.location.href = '?product=r3';" name="resource" value="3" id="resourceHero3" <?php if($hero['r3']!=0){ echo $checked="checked"; } ?> <?php echo $form->getRadio('resource',3); ?>>
			<label for="resourceHero3">
				<img title="آهن" class="r3" src="img/x.gif">
                <span class="current"> <?php echo $hero['product']; ?></span>
			</label>
		</div>
				<div class="resource">
			<input type="radio" onclick="window.location.href = '?product=r4';" name="resource" value="4" id="resourceHero4" <?php if($hero['r4']!=0){ echo $checked="checked"; } ?> <?php echo $form->getRadio('resource',4); ?>>
			<label for="resourceHero4">
				<img title="گندم" class="r4" src="img/x.gif">
                <span class="current"> <?php echo $hero['product']; ?></span>
			</label>
		</div>
			</div>
	<div class="clear"></div>
		</div>
  </div>
	<div class="boxes boxesColor gray"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">

<div class="attribute health tooltip" title="سلامتی||بازسازی قهرمان شما
<br><font color='#5dcbfb'>سلامتی: <?php echo $hero['autoregen']; ?>% در روز از قهرمان</font>">
<?php if($hero['dead']==0){ ?>
			<div class="element attribName">سلامتی</div>
			<div class="element current power"><span class="value"><?php echo round($hero['health']); ?></span>%</div>
			<div class="element progress">
				<div class="bar-bg">
                <?php
                if($hero['health']<=10){
                	$color = '#F00';
                }elseif($hero['health']<=25){
                	$color = '#F0B300';
                }elseif($hero['health']<=50){
                	$color = '#FFFF00';
                }elseif($hero['health']<=90){
                	$color = '#99C01A';
                }else{
                	$color = '#006900';
                }
                ?>
                
					<div class="bar" style="width:<?php echo $hero['health']; ?>%;background-color:<?php echo $color; ?>"></div>
				</div>
			</div>
<?php }else{ ?>
<div class="attributesHeadline"> دوباره زنده کردن قهرمان در این دهکده. </div>
<div class="clear"></div>
    <?php
    $vRes = ($village->awood+$village->aclay+$village->airon+$village->acrop);
    $hRes = ($tt2[$hero['level']]['wood']+$tt2[$hero['level']]['clay']+$tt2[$hero['level']]['iron']+$tt2[$hero['level']]['crop']);
$checkT = $database->getHeroTrain($hero['wref']);

if(!$checkT){
    if($village->awood < $tt2[$hero['level']]['wood'] || $village->aclay < $tt2[$hero['level']]['clay'] || $village->airon < $tt2[$hero['level']]['iron'] || $village->acrop < $tt2[$hero['level']]['crop']){
    	echo '<span class="none">منابع کافی برای زنده کردن قهرمان ندارد.</span>';
    }else{
        echo "<span class=\"regeneratebtn\"><button type=\"submit\" value=\"دوباره زنده کردن\" onclick=\"window.location.href = 'hero_inventory.php?r=1'; return false;\" name=\"save\" id=\"save\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">دوباره زنده کردن</div></div></button></span>";
    }
}else{
	echo "قهرمان تا <span id='timer1'>".$generator->getTimeFormat($checkT['eachtime']-time())."</span> ساعت زنده ﻣﻰشود.";
}
    ?>
        <div class="regenerateCosts">
        	<div class="showCosts">
            	<span class="resources r1 little_res" title="چوب">
                	<img class="r1" src="img/x.gif" title="چوب" />
					<?php echo $hero_t[$hero['level']]['wood']; ?>
                </span>
                <span class="resources r2 little_res" title="خشت">
                	<img class="r2" src="img/x.gif" title="خشت" />
					<?php echo $hero_t[$hero['level']]['clay']; ?>
                </span>
                <span class="resources r3 little_res" title="آهن">
                	<img class="r3" src="img/x.gif" title="آهن" />
					<?php echo $hero_t[$hero['level']]['iron']; ?>
                </span>
                <span class="resources r4 little_res" title="گندم">
                	<img class="r4" src="img/x.gif" title="گندم" />
					<?php echo $hero_t[$hero['level']]['crop']; ?>
                </span>
                <span class="resources r5" title="مصرف گندم">
                	<img class="r5" src="img/x.gif" title="مصرف گندم" />
                    6
                </span>
                <div class="clear"></div>
                <span class="clock">
                	<img class="clock" src="img/x.gif" title="مدت زمان">
                    <?php echo $generator->getTimeFormat(($hero_t[$hero['level']]['time']/SPEED*1.5)); ?>
                </span>
                <button type="button" value="" class="icon" onclick="window.location.href = 'build.php?gid=17&amp;t=3&amp;r1=<?php echo $hero_t[$hero['level']]['wood']; ?>&amp;r2=<?php echo $hero_t[$hero['level']]['clay']; ?>&amp;r3=<?php echo $hero_t[$hero['level']]['iron']; ?>&amp;r4=<?php echo $hero_t[$hero['level']]['crop']; ?>'; return false;"><img src="img/x.gif" class="npc" alt="npc"></button>
                <div class="clear"></div>
            </div>
        </div>
        <div class="clear"></div>
<?php } ?>
		</div>

		<div class="clear"></div>
			</div>
  </div>
  
	<div class="boxes boxesColor gray"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">
    
<div class="attribute experience tooltip" title="تجربه <?php echo round(100*(($hero['experience'] - $hero_levels[$hero['level']]) / ($hero_levels[$hero['level']+1] - $hero_levels[$hero['level']]))); ?>%||برای رسیدن به سطح <?php echo ($hero['level']+1); ?> قهرمان شما به <?php echo ($hero_levels[$hero['level']+1]-$hero['experience']); ?> تجربه نیاز دارد.">
			<div class="element attribName">تجربه</div>
			<div class="element current power"><?php echo $hero['experience']; ?></div>
			<div class="element progress">
				<div class="bar-bg">
					<div class="bar" style="width:<?php echo round(100*(($hero['experience'] - $hero_levels[$hero['level']]) / ($hero_levels[$hero['level']+1] - $hero_levels[$hero['level']])),1); ?>%;"></div>
				</div>
			</div>
            
			<div class="element add"></div>
			<div class="element points"><?php echo intval($hero['points']); ?></div>
			<div class="clear"></div>
		</div>

<div class="attribute level tooltip" title="سطح قهرمان||سطح قهرمان شما: <?php echo $hero['level']; ?><br><font color='#5dcbfb'>قدرت هجومی قهرمان شما برای هر امتیازی که به آن داده می‌شود به میزان <?php echo $tp; ?> افزایش خواهد یافت.</font>">
			<div class="element attribName">سطح قهرمان</div>
			<div class="element current power"><?php echo $hero['level']; ?></div>
			<div class="element progress">
				<div class="bar-bg">
					<div class="bar" style="width:<?php echo min(100,$hero['level']); ?>%"></div>
				</div>
			</div>
			<div class="clear"></div>
</div>
<?php
if($herodetail['horse'] == 1){
	$sHorse = "".(14*SPEED)." خانه در ساعت از اسب + ";
}
?>
<div class="attribute speed tooltip" title="سرعت||سرعت قهرمان شما<br><font color='#5dcbfb'>سرعت: <?php echo $sHorse; ?> 10 خانه در ساعت بدلیل نژاد</font>">
	<div class="element attribName">سرعت</div>
    <div class="element power">
    	<span class="currect"><?php echo $hero['speed']; ?></span> خانه در ساعت
    </div>
    <div class="clear"></div>
</div>

		</div>
  </div></div>

<?php
$heroid = $hero['heroid'];
if(isset($_GET['r'])==1){
	if($tribe==1){
		$each = (time() + ($hero_t1[$hero['level']]['time']/SPEED*1.5));
	}elseif($tribe==2){
		$each = (time() + ($hero_t2[$hero['level']]['time']/SPEED*1.5));
	}elseif($tribe==3){
		$each = (time() + ($hero_t3[$hero['level']]['time']/SPEED*1.5));
	}
	$database->trainHero($village->wid, $each, 0);
	$database->modifyResource($village->wid,$hwood,$hclay,$hiron,$hcrop,0);
    $database->modifyHero2('wref', $village->wid, $session->uid, 0);
    header("Location: hero_inventory.php");
}
if(isset($_GET['add'])){
if($hero['points']>0){
	if(isset($_GET['add']) && $_GET['add']==power){
		$database->modifyHero('power', $tp, $heroid, 1);
        $database->modifyHero('points', 1, $heroid, 2);
    }elseif(isset($_GET['add']) && $_GET['add']==offBonus){
		$database->modifyHero('offBonus', $tp, $heroid, 1);
        $database->modifyHero('points', 1, $heroid, 2);
    }elseif(isset($_GET['add']) && $_GET['add']==defBonus){
		$database->modifyHero('defBonus', $tp, $heroid, 1);
        $database->modifyHero('points', 1, $heroid, 2);
    }elseif(isset($_GET['add']) && $_GET['add']==productionPoints){
		$database->modifyHero('product', $rp, $heroid, 1);
        $database->modifyHero('points', 1, $heroid, 2);
    }
}
}

if(isset($_GET['product'])){
	for($i=0;$i<=4;$i++){
    	if($_GET['product'] == 'r'.$i){
        	if('r'.$i == 'r0'){
            	$prod = ($hero['product']/4);
            }else{
            	$prod = $hero['product'];
            }
    		$database->modifyHero('r'.$i, $prod, $heroid, 0);
        }else{
        	$database->modifyHero('r'.$i, 0, $heroid, 0);
        }
    }
}
?>