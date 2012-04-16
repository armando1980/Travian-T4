<?php



// Temp

$eigen = $database->getCoor($village->wid);

$from = array('x'=>$eigen['x'], 'y'=>$eigen['y']);

$to = array('x'=>$coor['x'], 'y'=>$coor['y']);

$time = $generator->procDistanceTime($from,$to,300,0);

// Temp

$ckey= $generator->generateRandStr(6);


 if (!isset($process['t1']) || $process['t1'] == ''){  $t1='0'; }else{  $t1=$process['t1']; }
 if (!isset($process['t2']) || $process['t2'] == ''){  $t2='0'; }else{  $t2=$process['t2']; } 
 if (!isset($process['t3']) || $process['t3'] == ''){  $t3='0'; }else{  $t3=$process['t3']; if ($session->tribe == 3){ $scout=1; } } 
 if (!isset($process['t4']) || $process['t4'] == ''){  $t4='0'; }else{  $t4=$process['t4']; if ($session->tribe == 1 || $session->tribe == 2 || $session->tribe == 4 || $session->tribe == 5){ $scout=1;} } 
 if (!isset($process['t5']) || $process['t5'] == ''){  $t5='0'; }else{  $t5=$process['t5']; } 
 if (!isset($process['t6']) || $process['t6'] == ''){  $t6='0'; }else{  $t6=$process['t6']; } 
 if (!isset($process['t7']) || $process['t7'] == ''){  $t7='0'; }else{  $t7=$process['t7']; } 
 if (!isset($process['t8']) || $process['t8'] == ''){  $t8='0'; }else{  $t8=$process['t8']; } 
 if (!isset($process['t9']) || $process['t9'] == ''){  $t9='0'; }else{  $t9=$process['t9']; } 
 if (!isset($process['t10']) || $process['t10'] == ''){  $t10='0'; }else{  $t10=$process['t10']; } 
 if (!isset($process['t11']) || $process['t11'] == ''){  $t11='0'; }else{  $t11=$process['t11']; $showhero=1;} 
 if ($session->tribe == 3){
 $totalunits =$process['t1']+$process['t2']+$process['t4']+$process['t5']+$process['t6']+$process['t7']+$process['t8']+$process['t9']+$process['t10']+$process['t11'];
 
 }else{
 
$totalunits=$process['t1']+$process['t2']+$process['t3']+$process['t5']+$process['t6']+$process['t7']+$process['t8']+$process['t9']+$process['t10']+$process['t11'];

 }

if ($scout==1 && $totalunits==0) {
$process['c'] = 1;
}

$id = $database->addA2b($ckey,time(),$process['0'],$t1,$t2,$t3,$t4,$t5,$t6,$t7,$t8,$t9,$t10,$t11,$process['c']);

if ($process['c']==1){
$actionType = "شناسایی";
}else if ($process['c']==2){
$actionType = "نیروی کمکی به";
}elseif ($process['c']==3){
$actionType = "حمله به";
}else{
$actionType = "غارت";
}


$uid = $session->uid;

$tribe = $session->tribe;
$start = ($tribe-1)*10+1;
$end = ($tribe*10);
?>

<h1><?php echo $actionType." ".$process[1]; ?></h1>            

<form method="post" action="a2b.php">

            <table id="short_info" cellpadding="1" cellspacing="1">

                <tbody>

                    <tr>

                        <th>هدف:</th>

                        <td><a href="karte.php?d=&amp;c="><?php echo $process[1]; ?> (<?php echo $coor['x']; ?>|<?php echo $coor['y']; ?>)</a></td>

                    </tr>

                    <tr>

                        <th>بازیکن:</th>

                        <td>
                        <?php if($process['2'] == 3){ ?>
                        <font class="none"><b>طبیعت</b></font>
                        <?php } else { ?>
                        <a href="spieler.php?uid=<?php echo $process['2']; ?>">
                        <?php if($process['2'] == 2){
                        	echo "ناتارها";
                            	} else {
                       				echo $database->getUserField($process['2'],'username',0);
                        		} ?>
                        </a>
                        <?php } ?>
                        </td>

                    </tr>

                </tbody>

            </table>



            <table class="troop_details" cellpadding="1" cellspacing="1">

                <thead>

                    <tr>

                        <td><?php echo $village->vname; ?></td>

                        <td colspan="<?php if($process['t11'] != ''){ echo"11"; }else{ echo"10"; } ?>"><?php echo $actionType." ".$process['1']; ?> (<?php echo $coor['x']; ?>|<?php echo $coor['y']; ?>)</td>

                    </tr>

                </thead>

                <tbody class="units">

                    <tr>

                        <td></td>
                 <?php 
                for($i=$start;$i<=($end);$i++) {
                      echo "<td><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";    
                  } if ($process['t11'] != ''){
                  echo "<td><img src=\"img/x.gif\" class=\"unit uhero\" title=\"قهرمان\" alt=\"قهرمان\" /></td>";    
                  
                  }?>
                        
                    </tr>

                    <tr>

                        <th>لشکریان</th>

                        <td <?php if (!isset($process['t1']) || $process['t1'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t1'];} ?></td>

                        <td <?php if (!isset($process['t2']) || $process['t2'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t2'];} ?></td>

                        <td <?php if (!isset($process['t3']) || $process['t3'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t3'];} ?></td>

                        <td <?php if (!isset($process['t4']) || $process['t4'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t4'];} ?></td>

                        <td <?php if (!isset($process['t5']) || $process['t5'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t5'];} ?></td>

                        <td <?php if (!isset($process['t6']) || $process['t6'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t6'];} ?></td>

                        <td <?php if (!isset($process['t7']) || $process['t7'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t7'];} ?></td>

                        <td <?php if (!isset($process['t8']) || $process['t8'] == ''){ echo "class=\"none\">0"; }else{ $kata='1'; echo ">".$process['t8'];} ?></td>

                        <td <?php if (!isset($process['t9']) || $process['t9'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t9'];} ?></td>

                        <td <?php if (!isset($process['t10']) || $process['t10'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t10'];} ?></td>

                        <?php if (!isset($process['t11']) || $process['t11'] == ''){ echo ""; }else{ echo "<td>".$process['t11']."</td>";} ?>

                     </tr>

                </tbody>
			<?php if ($process['c']==1){ ?>
                <tbody class="options">
                
                <tr>
            <th>تنظيمات</th>
            <td colspan="11"><input class="radio" name="spy" value="1" checked="checked" type="radio">شناسایی منابع و لشکریان<br>
            <input class="radio" name="spy" value="2" type="radio">شناسایی عوامل مدافع و لشکریان                                            </td>
        </tr>
    </tbody>
    <?php } ?>
                

        <?php if(isset($kata) AND $process['c']!='2'){?><tr>

            <?php if($process['c']=='3'){ ?><tbody class="cata">
                <tr>
                    <th>هدف:</th>
                    <td colspan="10">
                    
                        <select name="ctar1" class="dropdown">
                            <option value="0">تصادفی</option>
                            <?php if($building->getTypeLevel(16) >= 5) { ?>
                			<optgroup label="منابع">
                                <option value="1">هیزم شکن</option>
                                <option value="2">آجر سازی</option>
                                <option value="3">معدن آهن</option>
                                <option value="4">گندم زار</option>
                                <option value="5">چوب بری</option>
                                <option value="6">آجرپزی</option>
                                <option value="7">ذوب آهن</option>
                                <option value="8">آسیاب</option>
                                <option value="9">نانوایی</option>
                            </optgroup>
                            <?php } ?>
                            
                            <?php if($building->getTypeLevel(16) >= 3) { ?>
                            <optgroup label="زیر ساخت ها">
                                <option value="10">انبار</option>
                                <option value="11">انبار غذا</option>
                                <?php if($building->getTypeLevel(16) >= 10) { ?>
                                <option value="15">ساختمان اصلی</option>
                                <option value="17">بازار</option>
                                <option value="18">سفارت</option>
                                <option value="24">تالار شهر</option>
                                <option value="25">اقامتگاه</option>
                                <option value="26">قصر</option>
                                <option value="27">خزانه</option>
                                <option value="28">تجارت خانه</option>
                                <?php } ?>
                                <option value="38">انبار بزرگ</option>
                                <option value="39">انبار غذای بزرگ</option>
                            </optgroup>
                            <?php } ?>
                            <?php if($building->getTypeLevel(16) >= 10) { ?>
                            <optgroup label="نظامی">
                                <option value="12">آهنگری</option>
                                <option value="13">زره سازی</option>
                                <option value="14">میدان تمرین</option>
                                <option value="16">اردوگاه</option>
 								<option value="19">سربازخانه</option>
 								<option value="20">اصطبل</option>
 								<option value="21">کارگاه</option>
                                <option value="22">دارالفنون</option>
 								<option value="29">سربازخانه بزرگ</option>
  								<option value="30">اصطبل بزرگ</option>
  								<option value="37">عمارت قهرمان</option>
                            </optgroup>
                            <?php } ?>
                        </select>

            <?php if($building->getTypeLevel(16) == 20) { ?>
                     <select name="ctar2" class="dropdown">
                <option value="0">-</option>
                <option value="99">تصادفی</option>
                            <?php if($building->getTypeLevel(16) >= 5) { ?>
                            <optgroup label="منابع">
                           		<option value="1">هیزم شکن</option>
                                <option value="2">آجر سازی</option>
                                <option value="3">معدن آهن</option>
                                <option value="4">گندم زار</option>
                                <option value="5">چوب بری</option>
                                <option value="6">آجر پزی</option>
                            
                                <option value="7">ذوب آهن</option>
                                <option value="8">آسیاب</option>
                                <option value="9">نانوایی</option>
                            </optgroup>
                            <?php } ?>
                            <?php if($building->getTypeLevel(16) >= 3) { ?>
                            <optgroup label="زیر ساخت ها">
                                <option value="10">انبار</option>
                                <option value="11">انبار غذا</option>
                                <?php if($building->getTypeLevel(16) >= 10) { ?>
                                <option value="15">ساختمان اصلی</option>
                                <option value="17">بازار</option>
                                <option value="18">سفارت</option>
                                <option value="24">تالار شهر</option>
                                <option value="25">اقامتگاه</option>
                                <option value="26">قصر</option>
                                <option value="27">خزانه</option>
                                <option value="28">تجارت خانه</option>
                                <?php } ?>
                                <option value="38">انبار بزرگ</option>
                                <option value="39">انبار غذای بزرگ</option>
                            </optgroup>
                            <?php } ?>
                            <?php if($building->getTypeLevel(16) >= 10) { ?>
                            <optgroup label="نظامی">
                                <option value="12">آهنگری</option>
                                <option value="13">زره سازی</option>
                                <option value="14">میدان تمرین</option>
                                <option value="16">اردوگاه</option>
 								<option value="19">سربازخانه</option>
 								<option value="20">اصطبل</option>
 								<option value="21">کارگاه</option>
                                <option value="22">دارالفنون</option>
 								<option value="29">سربازخانه بزرگ</option>
  								<option value="30">اصطبل بزرگ</option>
  								<option value="37">عمارت قهرمان</option>
                            </optgroup>
                            <?php } ?>
                        </select>
                    <?php }?>

                    <span class="info">(مورد حمله منجنیق قرار خواهد گرفت)</span>
                     </td>
                </tr>
            </tbody><?PHP  
            }
            else if($process['c']=='4')
            {
                ?><tbody class="infos">  
                <th>هدف:</th>

            <td colspan="10">
                <?PHP
                
                echo"نکته: منجنیق <b>فقط</b> در حالت حمله عادی عمل میکند";
                ?>
                </td>

        </tr>
                <?PHP
            }
            ?>

        <?php } ?>



             <tbody class="infos">
    <tr>

   <th>زمان رسیدن:</th>

            

            <?php
            $speeds = array();
            $scout = 1;
                //find slowest unit.
                for($i=1;$i<=11;$i++){
                    if (isset($process['t'.$i])){
                        if( $process['t'.$i] != '' && $process['t'.$i] > 0){
                            if ($i<11) {
								$speeds[] = ${'u'.(($session->tribe-1)*10+$i)}['speed'];
							}else{
								$herodetail = $database->getHeroData($session->uid);
								$speeds[] = $herodetail['speed'];
							}

                            if($i != 4){
                                $scout = 0;
                            }
                        }
                    }
                }
            

            if($scout){
                $process['c'] = 1;
			}
                
                $time = $generator->procDistanceTime($from,$to,min($speeds),1);

            ?>

            

            <td colspan="<?php if($process['t11'] != ''){ echo"11"; }else{ echo"10"; } ?>">

            <div class="in">تا <?php echo $generator->getTimeFormat($time); ?> ساعت.</div>

            <div class="at">در <span id="tp2"> <?php echo date("H:i:s",time()+$time)?></span></div>

            </td>

        </tr>

    </tbody>

</table>

<input name="timestamp" value="<?php echo time(); ?>" type="hidden"> 

<input name="timestamp_checksum" value="<?php echo $ckey; ?>" type="hidden"> 

<input name="ckey" value="<?php echo $id; ?>" type="hidden"> 

<input name="id" value="39" type="hidden"> 

<input name="a" value="533374" type="hidden">
<input name="c" value="3" type="hidden">

<?php
$attacker = $database->getUserField($session->uid,'alliance',0);
$defender = $database->getUserField($process['2'],'alliance',0);
		if($attacker!=0 && $attacker==$defender){
			echo "<div class=\"alert\">اخطار! آیا مطمئن هستید که می‌خواهید به دوست خود حمله کنید؟</div>";
		}

    if($database->hasBeginnerProtection($process['0'])==1) {  
        echo"<div class=\"alert\"><b>بازیکن تحت حمایت تازه واردین است.</b></div>"; 
    } else { 
?> 
<button type="submit" value="ok" name="s1" id="btn_ok"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">تایید</div></div></button>

<?php } ?>
</form>
