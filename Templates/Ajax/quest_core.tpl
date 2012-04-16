<?php

include("GameEngine/Village.php");

$uArray = $database->getUserArray($_SESSION['username'],0);

if($message->unread && !$message->nunread) { $messagelol = "i2"; }
else if(!$message->unread && $message->nunread) { $messagelol = "i3"; }
else if($message->unread && $message->nunread) { $messagelol = "i1"; }
else { $messagelol = "i4"; }

if (isset($qact)){
 switch($qact) {
	case 'enter':
	$database->updateUserField($_SESSION['username'],'quest','1',0);
	$_SESSION['qst']= 1;
	break;
	
	case 'skip':
	$database->updateUserField($_SESSION['username'],'quest','23',0);
	$_SESSION['qst']= 23;
	$gold=$database->getUserField($_SESSION['username'],'gold','username');
	$gold+=25;
	$database->updateUserField($_SESSION['username'],'gold',$gold,0);
	$skiped=true;
	break;

	case '2':
	$database->updateUserField($_SESSION['username'],'quest','2',0);		
	$_SESSION['qst']= 2;	
	break;

	case '3':
	$database->updateUserField($_SESSION['username'],'quest','3',0);
	$_SESSION['qst']= 3;
    $today = date("mdHi");
	mysql_query("UPDATE ".TB_PREFIX."users set plus = ('".mktime(date("H"),date("i"), date("s"),date("m") , date("d"), date("Y"))."')+3600*24 where `username`='".$session->username."'") or die(mysql_error());
	break;

	case '4':
	$database->updateUserField($_SESSION['username'],'quest','4',0);
	$_SESSION['qst']= 4;
	
	//Give Reward
	$database->modifyResource($session->villages[0],130,160,130,100,1);		
	break;
	
	case '5':
    $database->updateUserField($_SESSION['username'],'quest','5',0);
	$_SESSION['qst']= 5;
    
	$rSubmited=$qact2;
    //Give Reward
	$database->modifyResource($session->villages[0],80,110,60,40,1);
	break;
	
	case '6':
	$database->updateUserField($_SESSION['username'],'quest','6',0);
	$_SESSION['qst']= 6;
	//Give Reward
	$database->modifyResource($session->villages[0],80,110,60,40,1);	
	
	break;

	case '7':
	$database->updateUserField($_SESSION['username'],'quest','7',0);
	$_SESSION['qst']= 7;
	$Subject="پیام از طرف کاردان";
	$Message="کاردان برای تو بدلیل انجام این وظیفۀ وی جایزه ای خواهد داد. <br /><br />[i]راهنمایی: این نامه بصورت اتوماتیک برای شما ایجاد شده است و نیازی به ارسال پاسخ به آن نمی باشد.[/i]";
	$database->sendMessage($session->userinfo['id'],0,$Subject,$Message,0);
	$RB=true;
		
	//Give Reward
	$database->modifyResource($session->villages[0],150,160,130,130,1);	
	break;
	
	case '8':
	$database->updateUserField($_SESSION['username'],'quest','8',0);
	$_SESSION['qst']= 8;
		
	//Give Reward
	$gold=$database->getUserField($_SESSION['username'],'gold','username');
	$gold+=20;
	$database->updateUserField($_SESSION['username'],'gold',$gold,0);
	break;
	
	case '9':
	$database->updateUserField($_SESSION['username'],'quest','9',0);
	$_SESSION['qst']= 9;	
		
	//Give Reward
	$database->modifyUnit($session->villages[0],100,120,40,40,1);
	break;
    
    case 'coor':
	$x=$qact2;
	break;
	
	case '10':
	$database->updateUserField($_SESSION['username'],'quest','10',0);
	$_SESSION['qst']= 10;
	
	//Give Reward
	$database->modifyResource($session->villages[0],60,30,40,90,1);	
	break;
	
	case '11':
	$database->updateUserField($_SESSION['username'],'quest','11',0);
	$_SESSION['qst']= 11;
		
	//Give Reward
	$database->modifyResource($session->villages[0],75,120,30,50,1);	
	break;
	
	case '12':
	$database->updateUserField($_SESSION['username'],'quest','12',0);
	$_SESSION['qst']= 12;
			
	//Give Reward
	$database->modifyResource($session->villages[0],120,200,140,100,1);
	break;
	
	case '13':
	$database->updateUserField($_SESSION['username'],'quest','13',0);
	$_SESSION['qst']= 13;
			
	//Give Reward
	$database->modifyResource($session->villages[0],150,180,30,130,1);
	break;
    
    case '14':
	$database->updateUserField($_SESSION['username'],'quest','14',0);
	$_SESSION['qst']= 14;
			
	//Give Reward
	$database->modifyResource($session->villages[0],60,50,40,30,1);
	break;
	
	case 'lumber':
	$lSubmited=$qact2;
	break;
	
	case '15':
	$database->updateUserField($_SESSION['username'],'quest','15',0);
	$_SESSION['qst']= 15;
			
	//Give Reward
	$database->modifyResource($session->villages[0],50,30,60,20,1);
	break;
	
	case '16':
	$database->updateUserField($_SESSION['username'],'quest','16',0);
	$_SESSION['qst']= 16;
	
	//Give Reward
	$database->modifyResource($session->villages[0],75,75,40,40,1);
	break;
    
    case 'rank':
	$rSubmited=$qact2;
	break;
	
	case '17':
	$database->updateUserField($_SESSION['username'],'quest','17',0);
	$_SESSION['qst']= 17;
	
	//Give Reward
	$database->modifyResource($session->villages[0],100,90,100,60,1);
	break;
	
	case '18':
	$database->updateUserField($_SESSION['username'],'quest','18',0);
	$_SESSION['qst']= 18;
	break;

	case '19':
	$database->updateUserField($_SESSION['username'],'quest','19',0);
	$_SESSION['qst']= 19;
    
    //Give Reward
	$database->modifyResource($session->villages[0],70,100,90,100,1);
	break;
	
	case '20':
	$database->updateUserField($_SESSION['username'],'quest','20',0);
	$_SESSION['qst']= 20;
	break;
	
	case '21':
	$database->updateUserField($_SESSION['username'],'quest','21',0);
	$_SESSION['qst']= 21;
    
    //Give Reward
    $database->modifyResource($session->villages[0],80,90,60,40,1);
	break;
	
	case '22':
	$database->updateUserField($_SESSION['username'],'quest','22',0);
	$_SESSION['qst']= 22;
	
	//Give Reward
	$database->modifyResource($session->villages[0],70,120,90,50,1);
	break;
	
    case '23':
    $database->updateUserField($_SESSION['username'],'quest','23',0);
    $_SESSION['qst']= 23;
    
    //Give Reward
    $database->modifyResource($session->villages[0],1200,200,200,450,1);
    break;
    
    case '24':
    $database->updateUserField($_SESSION['username'],'quest','24',0);
    $_SESSION['qst']= 24;
    
    //Give Reward
    $database->modifyResource($session->villages[0],80,90,60,40,1);
    break;
    
	case '225':
	$_SESSION['qst']= 25;
	break;
    case '226':
	$_SESSION['qst']= 26;
	break;
    case '227':
	$_SESSION['qst']= 27;
	break;
    case '228':
	$_SESSION['qst']= 28;
	break;
    case '229':
	$_SESSION['qst']= 29;
	break;
    case '330':
	$_SESSION['qst']= 30;
	break;
    case '331':
	$_SESSION['qst']= 31;
	break;
    case '332':
	$_SESSION['qst']= 32;
	break;
    case '333':
	$_SESSION['qst']= 33;
	break;
    case '334':
	$_SESSION['qst']= 34;
	break;
    case '335':
	$_SESSION['qst']= 35;
	break;
    
	case '25':
	$database->updateUserField($_SESSION['username'],'fquest','25',0);
	$_SESSION['qst']= 24;
	
	//Give Reward
	$gold=$database->getUserField($_SESSION['username'],'gold','username');
	$gold+=15;
	$database->updateUserField($_SESSION['username'],'gold',$gold,0);
	break;
    
    case '26':
	$database->updateUserField($_SESSION['username'],'fquest','26',0);
	$_SESSION['qst']= 24;
	
	//Give Reward
	$database->modifyResource($session->villages[0],140,200,180,200,1);
	break;
    
    case '27':
	$database->updateUserField($_SESSION['username'],'fquest','27',0);
	$_SESSION['qst']= 24;
	
	//Give Reward
	$database->modifyResource($session->villages[0],200,120,180,80,1);
	break;
    
    case '28':
	$database->updateUserField($_SESSION['username'],'fquest','28',0);
	$_SESSION['qst']= 24;
	
	//Give Reward
	$database->modifyResource($session->villages[0],240,280,180,100,1);
	break;
    
    case '29':
	$database->updateUserField($_SESSION['username'],'fquest','29',0);
	$_SESSION['qst']= 24;
	
	//Give Reward
	$database->modifyResource($session->villages[0],600,750,600,300,1);
	break;
    
    case '30':
	$database->updateUserField($_SESSION['username'],'fquest','30',0);
	$_SESSION['qst']= 24;
	
	//Give Reward
	$database->modifyResource($session->villages[0],900,850,600,300,1);
	break;
    
    case '31':
	$database->updateUserField($_SESSION['username'],'fquest','31',0);
	$_SESSION['qst']= 24;
	
	//Give Reward
	$database->modifyResource($session->villages[0],1800,2000,1650,800,1);
	break;
    
    case '32':
	$database->updateUserField($_SESSION['username'],'fquest','32',0);
	$_SESSION['qst']= 24;
	
	//Give Reward
	$database->modifyResource($session->villages[0],1600,1800,1950,1200,1);
	break;
    
    case '33':
	$database->updateUserField($_SESSION['username'],'fquest','33',0);
	$_SESSION['qst']= 24;
	
	//Give Reward
	$database->modifyResource($session->villages[0],3400,2800,3600,2200,1);
	break;
    
    case '34':
	$database->updateUserField($_SESSION['username'],'fquest','34',0);
	$_SESSION['qst']= 24;
	
	//Give Reward
	$database->modifyResource($session->villages[0],1050,800,900,750,1);
	break;
    
    case '35':
	$database->updateUserField($_SESSION['username'],'fquest','35',0);
    $database->updateUserField($_SESSION['username'],'quest','25',0);
	$_SESSION['qst']= 24;
	
	//Give Reward
	$database->modifyResource($session->villages[0],1600,2000,1800,1300,1);
	break;
    
    
}

}

header("Content-Type: application/json;");

      if($_SESSION['qst']== 0){
      if($session->userinfo['tribe'] == 1) {
                $tribes = "Romans";
                }
                else if($session->userinfo['tribe'] == 2) {
                $tribes = "Teutons";
                }
                else if($session->userinfo['tribe'] == 3) {
                $tribes = "Gauls";
                }
	  ?>

{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>به تراوین خوش آمدید!<\/h4><div class=\"spoken\">„می بینم که تو را به عنوان رئیس این دهکده انتخاب کرده اند. من در چند روز اول به عنوان مشاور برای تو کار خواهم کرد و می توانید من را در سمت راست صفحۀ بازی پیدا کنی.<br \/><\/div><span id=\"qst_accpt\"><a class=\"qle arrow\" href=\"javascript: qst_next('','enter'); \">به وظیفه اول.<\/a><a class=\"qri arrow\" href=\"javascript: qst_fhandle();\">نگاه به اطراف.<\/a><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/><div class=\"clear\"><\/div><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"intro<?php echo $tribes;?>\"><\/div>\n\t\t","number":null,"reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":1}

<?php } elseif($_SESSION['qst']== 1){

//Check one of Woodcutters is level 1 or upper 
$tRes = $database->getResourceLevel($session->villages[0]);
$woodL=$tRes['f1']+$tRes['f3']+$tRes['f14']+$tRes['f17'];
if ($woodL<1){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 1: هیزم شکن<\/h4><div class=\"spoken\">„در اطراف دهکدۀ تو 4 جنگل سبز موجود است. در یکی از آنها هیزم شکن بساز. چوب منبع مهمی برای دهکدۀ جدید ما می باشد.”<\/div><div class=\"rew\"><p class=\"ta_aw\">دستور:<\/p>یک هیزم شکن بساز.<\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"wood\"><\/div>\n\t\t","number":"-1","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 1: هیزم شکن<\/h4><div class=\"spoken\">„بله، اینطوری خواهی توانست چوب بیشتری بدست آوری.من کمی کمک کردم و ساخت را فوراً به اتمام رساندم.”<\/div><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/><div class=\"rew\"><p class=\"ta_aw\">جایزه تو:<\/p>هیزم شکن فورا ساخته شد.<br \/><\/div><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','2');\">به وظیفه بعدی عمل کن.<\/a><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"wood\"><\/div>\n\t\t","number":"-1","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 2){ 

//Check one of Croplands is level 1 or upper 
$tRes = $database->getResourceLevel($session->villages[0]);
$cropL=$tRes['f2']+$tRes['f8']+$tRes['f9']+$tRes['f12']+$tRes['f13']+$tRes['f15'];
if ($cropL<1){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 2: گندم<\/h4><div class=\"spoken\">„حال کارگران تو از کار کردن گرسنه شدند. یک گندم زار ارتقاء بده تا ذخیرۀ غذایی آنها را افزایش دهی. بعد از اینکه ساخت به اتمام رسید به اینجا برگرد.”<\/div><div class=\"rew\"><p class=\"ta_aw\">دستور:<\/p>یک گندمزار ارتقاء بده.<\/div><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"farm\"><\/div>\n\t\t","number":"-2","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 2: گندم<\/h4><div class=\"spoken\">„خوب است. حال روستاییان دوباره غذای کافی برای خوردن دارند...”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>جایزه تو:<\/p>1 روز Travian <b><span class=\"plus_g\">پلاس<\/span><\/b><\/div><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','3');\">به وظیفه بعدی عمل کن.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"farm\"><\/div>\n\t\t","number":2,"reward":{"plus":1},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 3){ 

$vName=$village->vname;
if ($vName== "دهکدۀ ".$session->userinfo['username']){
?>
{"markup":"\n\t\<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 3: نام دهکده شما<\/h4><div class=\"spoken\">„می توانی برای دهکدۀ خود نام زیبایی انتخاب کنی.<br><br>روی تابلوی دهکده که نام فعلی دهکده روی آن نوشته شده است دوبار کلیک (دوبل کلیک) کن...”<\/div><div class=\"rew\"><p class=\"ta_aw\">دستور:<\/p>نام دهکدۀ خود را به نامی زیبا تغییر بده.<\/div><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"village_name\"><\/div>\n\t\t","number":"-3","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 3: نام دهکده شما<\/h4><div class=\"spoken\">„اوه، چه نام زیبایی برای دهکده انتخاب کردی. من هم داشتم به همین نام فکر می کردم!”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">130<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">160<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">130<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img/x.gif\" alt=\"گندم\">100<\/span><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','4');\">به وظیفه بعدی عمل کن.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"village_name\"><\/div>\n\t\t","number":3,"reward":{"wood":130,"clay":160,"iron":130,"crop":100},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 4){ 

$rallypoint = $building->getTypeLevel(16);
if ($rallypoint == 0){
?>
{"markup":"\n\t\<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 4: اردوگاه<\/h4><div class=\"spoken\">„در اطرف دهکده مکان های مرموزی است که قادر به کاوش آنها می باشی. برای اینکه آمادۀ اینکار باشی نیاز به اردوگاه خواهی داشت.<br><br>برای اردوگاه محل خاصی برای ساخت در نظر گرفته شده است و قادر به ساخت آن در جای دیگری نمی باشی. این <a href=\"build.php?id=39\">محل ساخت<\/a> در کنار ساختمان اصلی دهکده هست. شکل آن تقریباً مانند نیم دایره است.”<\/div><div class=\"rew\"><p class=\"ta_aw\">دستور:<\/p>برای دهکده اردوگاه بساز.<\/div><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"rally\"><\/div>\n\t\t","number":"-4","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 4: اردوگاه<\/h4><div class=\"spoken\">„اردوگاه ساخته شد! حال قادر به تسخیر این جهان بازی هستی!کمی به تو کمک کردم و ساخت را به صورت فوری به اتمام رساندم.”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>جایزه تو:<\/p>اردوگاه فورا ساخته شد.<\/div><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','5');\">به وظیفه بعدی عمل کن.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"rally\"><\/div>\n\t\t","number":4,"reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 5){

// Compare real player rank with submited rank
$temp['uid']=$session->userinfo['id'];
$ranking->procRankReq($temp);
$displayarray = $database->getUserArray($temp['uid'],1);
$rRes=$ranking->searchRank($displayarray['username'],"username");
if ($rRes!=$rSubmited){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 5: سایر بازیکنان<\/h4><div class=\"spoken\">„در تراوین بازیکنان زیادی همراه تو بازی می کنند. بر روی <b>آمار<\/b> کلیک کرده و رتبۀ خود را در بازی پیدا کن و آن را در اینجا وارد کن.”<\/div><div class=\"rew\"><p class=\"ta_aw\">دستور:<\/p>رتبۀ خود را در آمار یافته و در اینجا وارد کن.<\/div><input id=\"qst_val\" class=\"text\" type=\"text\" name=\"qstin\" \/> <button type=\"button\" value=\"اتمام وظیفه.\" onclick=\"qst_next('','5',document.getElementById('qst_val').value)\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"><\/div><\/div><\/div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"><\/div><\/div><\/div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"><\/div><\/div><\/div><\/div><div class=\"button-contents\">اتمام وظیفه.<\/div><\/div><\/button><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"rank1\"><\/div>\n\t\t","number":-5,"reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 5: سایر بازیکنان<\/h4><div class=\"spoken\">„درست است، این رتبه توست.”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">80<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">110<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">60<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img/x.gif\" alt=\"گندم\">40<\/span><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','6');\">به وظیفه بعدی عمل کن.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"rank1\"><\/div>\n\t\t","number":5,"reward":{"wood":80,"clay":110,"iron":60,"crop":40},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 6){ 

//Check one of Iron Mines and one of Clay Pites are level 1 or upper 
$tRes = $database->getResourceLevel($session->villages[0]);
$ironL=$tRes['f4']+$tRes['f7']+$tRes['f10']+$tRes['f11'];
$clayL=$tRes['f5']+$tRes['f6']+$tRes['f16']+$tRes['f18'];
if ($ironL<1 || $clayL<1){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 6: دستور ساخت دو ساختمان جدید<\/h4><div class=\"spoken\">„یک معدن آهن و یک آجرسازی بساز. همیشه به <b>آهن<\/b> و <b>خشت<\/b> نیاز خواهی داشت.<br><br>با اساتفاده از اکانت <b><font color=\"#71D000\">پلاسی<\/font><\/b> که کمی پیش به تو دادم، می توانی دستور ساخت هر دو را همزمان بدی.”<\/div><div class=\"rew\"><p class=\ta_aw\"><b>دستور:<\/b><\/p><ul><li>یک معدن آهن ارتقاء بده.<\/li><li>یک آجرسازی ارتقاء بده.<\/li><\/ul><\/div><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"clay_iron\"><\/div>\n\t\t","number":-6,"reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 6: دستور ساخت دو ساختمان جدید<\/h4><div class=\"spoken\">„همانطور که می بینی ساخت ساختمان ها مدتی طول می کشد. جهان تراوین حتی زمانی که تو در اکانت خود نمی باشی در حال ادامه است و حتی بعد از چند ماه نیز چیزهای جدیدی کشف می کنی. \r\n<br \/><br \/>\r\nبهترین راه این است که هر چند وقت یکبار دهکده را کنترل کرده و به کارگران خود دستورهای لازم را بدی.”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"1چوب\">50<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">160<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">130<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img/x.gif\" alt=\"گندم\">130<\/span><\/div><br \/><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','7');\">به وظیفه بعدی عمل کن.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"clay_iron\"><\/div>\n\t\t","number":6,"reward":{"wood":150,"clay":160,"iron":130,"crop":130},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 7){ 

//Check message is viewed or no
if ($message->unread || $RB==true){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 7: پیام ها<\/h4><div class=\"spoken\">„از سیستم پیام می توانی برای ارتباط با بقیۀ بازیکنان استفاده کنی. برای تو پیامی ارسال کردم. آن را خوانده و دوباره به اینجا برگرد.<br><br>سیستم نامه ها آخرین گزینه (سمت چپ ترین گزینه) در بالای صفحه می باشد.”<\/div><div class=\"rew\"><p class=\"ta_aw\">دستور:<\/p>پیام جدیدت را بخوان.<\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"msg\"><\/div>\n\t\t","number":"-6","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"i2","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 7: پیام ها<\/h4><div class=\"spoken\">„پیام را خواندی؟ بسیار عالی.<br><br>برای تو کمی سکۀ طلای تراوین می دهم. با سکۀ طلای تراوین می توانی کارهای متفاوتی انجام دهی، برای مثال تمدید اکانت <b><font color=\"#71D000\">پلاس<\/font><\/b> و یا افزایش تولید منابع. برای اینکار در بالای دهکدۀ خود روی عکس سکه های طلا کلیک کن.”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>جایزه تو:<\/p><span class=\"gold\"><img src=\"img\/x.gif\" class=\"gold\" title=\"سکۀ طلای تراوین\"> 20<\/span><\/div><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','8');\">به وظیفه بعدی عمل کن.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"msg\"><\/div>\n\t\t","number":6,"reward":{"gold":20},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 8){

$tRes = $database->getResourceLevel($session->villages[0]);
$ironL=0;$clayL=0;$woodL=0;$cropL=0;

if($tRes['f1']>0){$woodL++;};
if($tRes['f3']>0){$woodL++;};
if($tRes['f14']>0){$woodL++;};
if($tRes['f17']>0){$woodL++;};
if($tRes['f5']>0){$clayL++;};
if($tRes['f6']>0){$clayL++;};
if($tRes['f16']>0){$clayL++;};
if($tRes['f18']>0){$clayL++;};
if($tRes['f4']>0){$ironL++;};
if($tRes['f7']>0){$ironL++;};
if($tRes['f10']>0){$ironL++;};
if($tRes['f11']>0){$ironL++;};
if($tRes['f2']>0){$cropL++;};
if($tRes['f8']>0){$cropL++;};
if($tRes['f9']>0){$cropL++;};
if($tRes['f12']>0){$cropL++;};
if($tRes['f13']>0){$cropL++;};
if($tRes['f15']>0){$cropL++;};

if ($ironL<2 || $clayL<2 || $woodL<2 || $cropL<2){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 8: یکی از هر کدام.<\/h4><div class=\"spoken\">„در تراوین همیشه کاری برای انجام می باشد! تا زمانی که نتیجۀ ماجراحویی مشخص شود، یک هیزم شکن، آجرسازی، معدن آهن و گندم زار دیگر را به سطح 1 ارتقاء بده.”<\/div><div class=\"rew\"><p class=\"ta_aw\">دستور:<\/p>از هر منبع یکی دیگر را به مرحله 1 برسان.<\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"res_one_of_each\"><\/div>\n\t\t","number":-8,"reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 8: یکی از هر کدام.<\/h4><div class=\"spoken\">„بسیار عالی، تولید منابع دهکده در حال افزایش است.”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">100<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">120<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">40<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img/x.gif\" alt=\"گندم\">40<\/span><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','9');\">به وظیفه بعدی عمل کن.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"res_one_of_each\"><\/div>\n\t\t","number":8,"reward":{"wood":100,"clay":120,"iron":40,"crop":40},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 9){

$getvID = $database->getVillageID($session->uid);
$coor = $database->getCoor($getvID);

if ($x!=$coor[y]){

?>

{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 9: مختصات<\/h4><div class=\"spoken\">„نام دهکده تو <b><?php echo $village->vname; ?><\/b> می باشد.<br><br>بالای صفحه گزینۀ ”نقشه” را انتخاب کرده و این دهکده را پیدا کن. اکر ماوس را روی دهکده ها ببری نام دهکده برای تو نمایش داده خواهد شد.”<\/div><div class=\"rew\"><p class=\"ta_aw\">دستور:<\/p>مختصات <b><?php echo $village->vname; ?><\/b> را پیدا کرده و آن را اینجا وارد کن.<\/div><div class=\"coordinatesInput\"><div class=\"xCoord\"><label for=\"xCoordInputQuest\">X:<\/label><input maxlength=\"4\" value=\"\" id=\"qst_val\" name=\"x\" id=\"xCoordInputQuest\" class=\"text coordinates x \"><\/div><div class=\"yCoord\"><label for=\"yCoordInputQuest\">Y:<\/label><input maxlength=\"4\" value=\"\" name=\"y\" id=\"yCoordInputQuest\" class=\"text coordinates y \"><\/div><div class=\"clear\"><\/div><\/div><button type=\"button\" value=\"اتمام وظیفه.\" class=\"coordinatesButton\" onclick=\"qst_next('','coor',document.getElementById('qst_val').value)\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"><\/div><\/div><\/div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"><\/div><\/div><\/div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"><\/div><\/div><\/div><\/div><div class=\"button-contents\">اتمام وظیفه.<\/div><\/div><\/button><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"neighbour\"><\/div>\n\t\t","number":-9,"reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 9: مختصات<\/h4><div class=\"spoken\">„عالیست، این مختصات <b><?php echo $village->vname; ?><\/b> است! برای تو به اندازۀ ارزش این دهکده منابع ارسال می کنم، خوب تقریباً.”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">60<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">30<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">40<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img/x.gif\" alt=\"گندم\">90<\/span><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','10');\">به وظیفه بعدی عمل کن.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"neighbour\"><\/div>\n\t\t","number":9,"reward":{"wood":60,"clay":30,"iron":40,"crop":90},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 10){

//Check additional of each resource upgraded to lvl1 or upper
$tRes = $database->getResourceLevel($session->villages[0]);
$ironL=0;$clayL=0;$woodL=0;$cropL=0;
if($tRes['f4']>0){$ironL++;};if($tRes['f7']>0){$ironL++;};if($tRes['f10']>0){$ironL++;};if($tRes['f11']>0){$ironL++;}
if($tRes['f5']>0){$clayL++;};if($tRes['f6']>0){$clayL++;};if($tRes['f16']>0){$clayL++;};if($tRes['f18']>0){$clayL++;}
if($tRes['f1']>0){$woodL++;};if($tRes['f3']>0){$woodL++;};if($tRes['f14']>0){$woodL++;};if($tRes['f17']>0){$woodL++;}
if($tRes['f2']>0){$cropL++;};if($tRes['f8']>0){$cropL++;};if($tRes['f9']>0){$cropL++;};if($tRes['f12']>0){$cropL++;};if($tRes['f13']>0){$cropL++;};if($tRes['f15']>0){$cropL++;}
if ($ironL<4 || $clayL<4 || $woodL<4 || $cropL<6){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 10: همه چیز به 1.<\/h4><div class=\"spoken\">„حال باید کمی تولید منابع دهکده را بالا ببریم. تمامی مزارع و معادن خود را به سطح 1 ارتقاء بده.”<\/div><div class=\"rew\"><p class=\"ta_aw\">دستور:<\/p>همه منابع را به سطح 1 برسان.<\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"res_all_one\"><\/div>\n\t\t","number":-12,"reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 10: همه چیز به 1.<\/h4><div class=\"spoken\">„بسیار عالی، تولید منابع دهکده در حال افزایش است.<br><br>بزودی می توانیم در دهکده شروع به بنای ساختمان کنیم.”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">75<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">120<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">30<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img/x.gif\" alt=\"گندم\">50<\/span><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','11');\">به وظیفه بعدی عمل کن.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"res_all_one\"><\/div>\n\t\t","number":12,"reward":{"wood":75,"clay":120,"iron":30,"crop":50},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 11){ 

//Check player Descriptions for [#0]
$Dave= strrpos ($uArray['desc1'],'[#0]');
$Dave2=strrpos ($uArray['desc2'],'[#0]');
if (!is_numeric($Dave) and !is_numeric($Dave2)){?>
{"markup":"\n\t\t<div id=\"qstd\"><h4>وظیفه 11: کبوتر صلح<\/h4><div class=\"spoken\">„چند روز اول بعد از ثبت نام، از تو محافظت می شود و دیگران قادر به حمله به دهکدۀ تو نخواهند بود. تو می توانی زمان باقی مانده از این حمایت را با وارد کردن کد <b>[#0]<\/b> در پروفایل خود ببینی.”<\/div><div class=\"rew\"><p class=\"ta_aw\">دستور:<\/p>کد <b>[#0]<\/b> را در یکی از دو قسمت موجود در پروفایل خود وارد کن.<\/div><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"medal\"><\/div>\n\t\t","number":"-11","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 11: کبوتر صلح<\/h4><div class=\"spoken\">„بسیار عالی! اگر ماوس را بر روی تصویر کبوتر ببری، برای تو زمان باقی مانده از ”حمایت تازه واردین” تو نمایش داده خواهد شد.”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">120<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">200<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">140<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img/x.gif\" alt=\"گندم\">100<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','12');\">به وظیفه بعدی عمل کن.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"medal\"><\/div>\n\t\t","number":11,"reward":{"wood":120,"clay":200,"iron":140,"crop":100},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 12){

//Check cranny builded or no
$cranny = $building->getTypeLevel(23);
if ($cranny == 0){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 12: مخفیگاه<\/h4><div class=\"spoken\">„حال زمان بنای مخفیگاه می باشد. دنیای تراوین خطرناک است.<br><br>بسیاری از بازیکنان منابع خود را از غارت بازیکنان دیگر بدست می آورند. یک مخفیگاه برای مخفی کردن مقداری از منابع از دید دشمنان درست کن.”<\/div><div class=\"rew\"><p class=\"ta_aw\">دستور:<\/p>یک مخفیگاه بساز.</div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"cranny\"><\/div>\n\t\t","number":-12,"reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 12: مخفیگاه<\/h4><div class=\"spoken\">„بسیار عالی! اگر ماوس را بر روی تصویر کبوتر ببری، برای تو زمان باقی مانده از ”حمایت تازه واردین” تو نمایش داده خواهد شد.”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">150<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">180<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">30<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img/x.gif\" alt=\"گندم\">130<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','13');\">به وظیفه بعدی عمل کن.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"cranny\"><\/div>\n\t\t","number":12,"reward":{"wood":150,"clay":180,"iron":30,"crop":130},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 13){

//Check one of each resource is lvl2 or upper
$tRes = $database->getResourceLevel($session->villages[0]);
$ironL=0;$clayL=0;$woodL=0;$cropL=0;
if($tRes['f4']>1){$ironL++;};if($tRes['f7']>1){$ironL++;};if($tRes['f10']>1){$ironL++;};if($tRes['f11']>1){$ironL++;}
if($tRes['f5']>1){$clayL++;};if($tRes['f6']>1){$clayL++;};if($tRes['f16']>1){$clayL++;};if($tRes['f18']>1){$clayL++;}
if($tRes['f1']>1){$woodL++;};if($tRes['f3']>1){$woodL++;};if($tRes['f14']>1){$woodL++;};if($tRes['f17']>1){$woodL++;}
if($tRes['f2']>1){$cropL++;};if($tRes['f8']>1){$cropL++;};if($tRes['f9']>1){$cropL++;};if($tRes['f12']>1){$cropL++;};if($tRes['f13']>1){$cropL++;};if($tRes['f15']>1){$cropL++;}
if ($ironL<1 || $clayL<1 || $woodL<1 || $cropL<1){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 13: به دو.<\/h4><div class=\"spoken\">„در تراوین همیشه کاری برای انجام می باشد! یک هیزم شکن،آجرسازی، معدن آهن و گندم زار دیگر را به سطح 2 ارتقاء بده.”<\/div><div class=\"rew\"><p class=\"ta_aw\">دستور:<\/p>از هر منبع یکی دیگر را به مرحله 2 برسان.<\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"res_two_of_each\"><\/div>\n\t\t","number":"-13","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 13: به دو.<\/h4><div class=\"spoken\">„خیلی خوب است، دهکده در حال رونق است!”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">60<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">50<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">40<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img/x.gif\" alt=\"گندم\">30<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','14');\">به وظیفه بعدی عمل کن.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"res_two_of_each\"><\/div>\n\t\t","number":13,"reward":{"wood":60,"clay":50,"iron":40,"crop":30},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 14){ 

//Check player submited number Barracks cost lumber
if ($lSubmited!=210){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 14: دستورالعمل<\/h4><div class=\"spoken\">„در دستورالعمل داخل بازی می توانی در مورد ساختمان ها و لشکریان موجود در تراوین اطلاعات مختصری پیدا کنی.<br><br>روی کتاب سیاه رنگ پایین صفحه (سمت راست) کلیک کن و ببین برای ساخت سربازخانه به چه مقدار چوب نیاز داری.”<\/div><div class=\"rew\">ساخت سربازخانه به چه مقدار چوب نیاز داری.”<\/div><div class=\"rew\">مقدار چوب مورد نیاز برای ساخت سربازخانه را وارد کن.<\/div><input id=\"qst_val\" class=\"text\" type=\"text\" name=\"qstin\" onkeypress=\"if (event.keyCode==13) {qst_next('','lumber',document.getElementById('qst_val').value);}\"> <button type=\"button\" value=\"اتمام وظیفه.\" onclick=\"qst_next('','lumber',document.getElementById('qst_val').value)\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"><\/div><\/div><\/div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"><\/div><\/div><\/div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"><\/div><\/div><\/div><\/div><div class=\"button-contents\">اتمام وظیفه.<\/div><\/div><\/button><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"cost\"><\/div>\n\t\t","number":"-14","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 14: دستورالعمل<\/h4><div class=\"spoken\">„دقیقا! ساخت سربازخانه 210 چوب مصرف خواهد کرد.”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">50<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">30<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">60<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img/x.gif\" alt=\"گندم\">20<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','15');\">به وظیفه بعدی عمل کن.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"cost\"><\/div>\n\t\t","number":14,"reward":{"wood":50,"clay":30,"iron":60,"crop":20},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 15){

//Check main building lvl is 3 or upper
$mainbuilding = $building->getTypeLevel(15);
if ($mainbuilding<3){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 15: ساختمان اصلی<\/h4><div class=\"spoken\">„معماران تو نیاز به ساختمان اصلی سطح 3 دارند تا بتوانند ساختمان های مهم دیگر مانند بازار و سربازخانه را بنا کنند.”<\/div><div class=\"rew\"><p class=\"ta_aw\">دستور:<\/p>ساختمان اصلی را به سطح 3 برسان.<\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"main\"><\/div>\n\t\t","number":-15,"reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 15: ساختمان اصلی<\/h4><div class=\"spoken\">„عالیست. ساختمان اصلی به سطح 3 رسید.<br><br>با ارتقاء ساختمان اصلی نه تنها معماران تو قادر به ساخت انواع جدید از ساختمان ها خواهند بود بلکه سرعت ساخت آنها نیز افزایش خواهد یافت.”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">75<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">75<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">40<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img/x.gif\" alt=\"گندم\">40<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','16');\">به وظیفه بعدی عمل کن.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"main\"><\/div>\n\t\t","number":15,"reward":{"wood":75,"clay":75,"iron":40,"crop":40},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 16){

// Compare real player rank with submited rank
$temp['uid']=$session->userinfo['id'];
$ranking->procRankReq($temp);
$displayarray = $database->getUserArray($temp['uid'],1);
$rRes=$ranking->searchRank($displayarray['username'],"username");
if ($rRes!=$rSubmited){ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 16: پیشرفت!<\/h4><div class=\"spoken\">„دوباره به رتبه خود در آمار نگاه کن و از پیشرفت خود لذت ببر.”</div><div class=\"rew\"><p class=\"ta_aw\">دستور:<\/p>به رتبه خود در آمار نگاه کن و آن را اینجا وارد کن.<\/div><input id=\"qst_val\" class=\"text\" type=\"text\" name=\"qstin\" onkeypress=\"if (event.keyCode==13) {qst_next('','rank',document.getElementById('qst_val').value);}\"> <button type=\"button\" value=\"اتمام وظیفه.\" onclick=\"qst_next('','rank',document.getElementById('qst_val').value)\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"><\/div><\/div><\/div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"><\/div><\/div><\/div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"><\/div><\/div><\/div><\/div><div class=\"button-contents\">اتمام وظیفه.<\/div><\/div><\/button><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"rank2\"><\/div>\n\t\t","number":"-16","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 16: پیشرفت!<\/h4><div class=\"spoken\">„عالیست! آری این رتبه توست.”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">100<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">90<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">100<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img/x.gif\" alt=\"گندم\">60<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','17');\">به وظیفه بعدی عمل کن.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"rank2\"><\/div>\n\t\t","number":16,"reward":{"wood":100,"clay":90,"iron":100,"crop":60},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 17){

// Ask from plyer ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 17: نظامی یا اقتصادی<\/h4><div class=\"spoken\">„حال باید مسیری برای خود انتخاب کنی: می خواهی به صورت اقتصادی ادامه دهی و یا نظامی.<br><br>برای بازار به انبار غذا و برای لشکر به سربازخانه نیاز داری.”<\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><button type=\"button\" value=\"اقتصادی\" class=\"qb1 granary_barracks\" onclick=\"javascript: qst_next('','20');\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"><\/div><\/div><\/div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"><\/div><\/div><\/div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"><\/div><\/div><\/div><\/div><div class=\"button-contents\">اقتصادی<\/div><\/div><\/button><button type=\"button\" value=\"نظامی\" class=\"qb2 granary_barracks\" onclick=\"javascript: qst_next('','18');\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"><\/div><\/div><\/div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"><\/div><\/div><\/div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"><\/div><\/div><\/div><\/div><div class=\"button-contents\">نظامی<\/div><\/div><\/button><div class=\"clear\"><\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"granary_barracks\"><\/div>\n\t\t","number":"-17","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}

<?php } elseif($_SESSION['qst']== 18){

// Checking rollypoint builded or no
$barrack = $building->getTypeLevel(19);
if ($barrack==0){ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 18: نظامی<\/h4><div class=\"spoken\">„انتخاب شجاعانه ای بود. برای تربیت لشکر به سربازخانه نیاز داری.”<\/div><div class=\"rew\"><p class=\"ta_aw\">دستور:<\/p>سربازخانه بساز.<\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"granary_barracks2\"><\/div>\n\t\t","number":"-18","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 18: نظامی<\/h4><div class=\"spoken\">„ساخت سربازخانه تمام شد. حال یک قدم به تسخیر دنیای تراوین نزدیکتر شدی.”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">70<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">100<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">90<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img\/x.gif\" alt=\"گندم\">100<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','19');\">به وظیفه بعدی عمل کن.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"granary_barracks2\"><\/div>\n\t\t","number":18,"reward":{"wood":70,"clay":100,"iron":90,"crop":100},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php } ?>

<?php } elseif($_SESSION['qst']== 19){

// Checking 2 warrior trained or no
$units = $village->unitall;
$unarray=array("","سرباز لژیون", "گرزدار","سرباز پیاده");
$unarray2=array("","u1", "u11","u21");
if ($units[$unarray2[$session->userinfo['tribe']]]<2){ ?>

{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 19: تربیت.<\/h4><div class=\"spoken\">„حال که تو سربازخانه داری قادر به تربیت لشکری می باشی. 2 عدد <?php echo $unarray[$session->userinfo['tribe']];?> تربیت کن.”<\/div><div class=\"rew\"><p class=\"ta_aw\">دستور:<\/p>2 عدد <?php echo $unarray[$session->userinfo['tribe']];?> تربیت کن.<\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"units\"><\/div>\n\t\t","number":"-19","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 19: تربیت.<\/h4><div class=\"spoken\">„حال تو در حال ساخت ارتش عظیمی می باشی.<br><br>قبل از اینکه نیورهای خود را برای غارت ارسال کنی ابتدا در <a href=\"warsim.php\">شبیه ساز جنگ<\/a> کنترل کن تا بدانی برای مبارزه با یک موش صحرایی نیاز به چه اندازه لشکری داری تا تلفاتی نداشته باشی.”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">300<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">320<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">360<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img\/x.gif\" alt=\"گندم\">570<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','23');\">به وظیفه بعدی عمل کن.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"units\"><\/div>\n\t\t","number":19,"reward":{"wood":300,"clay":320,"iron":360,"crop":570},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php } ?>

<?php } elseif($_SESSION['qst']== 20){

// Checking granary builded or no
$granary = $building->getTypeLevel(11);
if ($granary ==0){ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 18: اقتصادی<\/h4><div class=\"spoken\">„تجارت و اقتصاد انتخاب تو بود. مطمئناً آیندۀ خوبی در انتظار توست!”<\/div><div class=\"rew\"><p class=\"ta_aw\">دستور:<\/p>یک انبار غذا بنا کن.<\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"granary_barracks1\"><\/div>\n\t\t","number":"-20","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 18: اقتصادی<\/h4><div class=\"spoken\">„بسیار عالی! با انباز غذا قادر به ذخیرۀ بیشتر گندم خواهی بود.”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">80<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">90<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">60<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img\/x.gif\" alt=\"گندم\">40<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','21');\">به وظیفه بعدی عمل کن.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"granary_barracks1\"><\/div>\n\t\t","number":20,"reward":{"wood":80,"clay":90,"iron":60,"crop":40},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php } ?>

<?php } elseif($_SESSION['qst']==21){

// Checking warehouse builded or no
$warehouse = $building->getTypeLevel(10);
if ($warehouse==0){ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 19: انبار<\/h4><div class=\"spoken\">„فقط گندم نیست که جا میگیرد، تو برای ذخیره کردن بیشتر منابع خود هم به انبار احتیاج داری...”<\/div><div class=\"rew\"><p class=\"ta_aw\">دستور:<\/p>یک انبار بنا کن.<\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"warehouse\"><\/div>\n\t\t","number":"-21","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 19: انبار<\/h4><div class=\"spoken\">„عالی، انبار تو ساخته شد... <br><br>حال تو تمامی پیش نیازهای لازم برای ساخت بازار را داری.”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">70<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">120<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">90<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img\/x.gif\" alt=\"گندم\">50<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','22');\">به وظیفه بعدی عمل کن.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"warehouse\"><\/div>\n\t\t","number":21,"reward":{"wood":70,"clay":120,"iron":90,"crop":50},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php } ?>

<?php } elseif($_SESSION['qst']== 22){

// Checking market builded or no
$market = $building->getTypeLevel(17);
if ($market==0){ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 20: بازار<\/h4><div class=\"spoken\">„یک بازار بساز تا قادر به تجارت با بازیکن دیگر باشی.”<\/div><div class=\"rew\"><p class=\"ta_aw\">دستور:<\/p>یک بازار بنا کن.<\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"market\"><\/div>\n\t\t","number":"-22","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 20: بازار<\/h4><div class=\"spoken\">„ساخت بازار تمام شد. حال قادر به ایجاد پیشنهاد تجارت و یا پذیرش پیشنهاد های بازیکنان دیگر می باشی! هنگام ارائۀ پیشنهاد می توانی کمی دقت کنی تا ببینی دیگران بیشتر به چه منبعی نیاز دارند تا در تجارت های خود سود بیشتری داشته باشی.”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">1200<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">200<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">200<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img\/x.gif\" alt=\"گندم\">450<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','23');\">به وظیفه بعدی عمل کن.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"market\"><\/div>\n\t\t","number":22,"reward":{"wood":1200,"clay":200,"iron":200,"crop":450},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php } ?>

<?php } elseif($_SESSION['qst']== 23){

$unarray=array("","دیوار شهر", "دیوار گلی","پرچین");


$wall = $village->resarray['f40'];
if ($wall==0){?>

{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 20: برای دهکده <?php echo $unarray[$session->userinfo['tribe']];?> بساز.<\/h4><div class=\"spoken\">„حال که تعدادی سرباز تربیت کردی، باید برای دهکده <?php echo $unarray[$session->userinfo['tribe']];?> بسازی. <?php echo $unarray[$session->userinfo['tribe']];?> قدرت دفاعی دهکده و سربازان را بیشتر خواهد کرد.”<\/div><div class=\"rew\"><p class=\"ta_aw\">دستور:<\/p><?php echo $unarray[$session->userinfo['tribe']];?> بساز.<\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"wall<?php echo $session->userinfo['tribe'];?>\"><\/div>\n\t\t","number":"-23","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\<div id=\"popup3\"><div id=\"qstd\"><h4>وظیفه 20: برای دهکده <?php echo $unarray[$session->userinfo['tribe']];?> بساز.<\/h4><div class=\"spoken\">„بسیار عالی. <?php echo $unarray[$session->userinfo['tribe']];?> ساخته شد. حال دهکدۀ تو قدرت دفاعی بیشتری خواهد داشت.”<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">200<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">120<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">180<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img\/x.gif\" alt=\"گندم\">80<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','24');\">به وظیفه بعدی عمل کن.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"wall<?php echo $session->userinfo['tribe'];?>\"><\/div>\n\t\t","number":23,"reward":{"wood":80,"clay":90,"iron":60,"crop":40},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php } ?>

<?php } ?>

<?php

if ($database->getUserField($_SESSION['username'],'fquest','username')>=25){
$ff25 = "<div class=none><b>همه چیز به دو!<\/b><\/div>";
} else { $ff25 = "<a onclick=qst_next('','225')>همه چیز به دو!<\/a>"; }

if ($database->getUserField($_SESSION['username'],'fquest','username')>=26){
$ff26 = "<div class=none><b>ساخت بازار سطح 1.<\/b><\/div>";
} else { $ff26 = "<a onclick=qst_next('','226')>ساخت بازار سطح 1.<\/a>"; }

if ($database->getUserField($_SESSION['username'],'fquest','username')>=27){
$ff27 = "<div class=none><b>سفارت<\/b><\/div>";
} else { $ff27 = "<a onclick=qst_next('','227')>سفارت<\/a>"; }

if ($database->getUserField($_SESSION['username'],'fquest','username')>=28 && $database->getUserField($_SESSION['username'],'alliance','username')>0){
$ff28 = "<div class=none><b>اتحاد<\/b><\/div>";
} else { $ff28 = "<a onclick=qst_next('','228')>اتحاد<\/a>"; }

if ($database->getUserField($_SESSION['username'],'fquest','username')>=29){
$ff29 = "<div class=none><b>ساختمان اصلی به سطح 5.<\/b><\/div>";
} else { $ff29 = "<a onclick=qst_next('','229')>ساختمان اصلی به سطح 5.<\/a>"; }

if ($database->getUserField($_SESSION['username'],'fquest','username')>=30){
$ff30 = "<div class=none><b>انبار غذا به سطح 3.<\/b><\/div>";
} else { $ff30 = "<a onclick=qst_next('','330')>انبار غذا به سطح 3.<\/a>"; }

if ($database->getUserField($_SESSION['username'],'fquest','username')>=31){
$ff31 = "<div class=none><b>انبار به سطح 7.<\/b><\/div>";
} else { $ff31 = "<a onclick=qst_next('','331')>انبار به سطح 7.<\/a>"; }

if ($database->getUserField($_SESSION['username'],'fquest','username')>=32){
$ff32 = "<div class=none><b>همه چیز به 5.<\/b><\/div>";
} else { $ff32 = "<a onclick=qst_next('','332')>همه چیز به 5.<\/a>"; }

if ($database->getUserField($_SESSION['username'],'fquest','username')>=33){
$ff33 = "<div class=none><b>اقامتگاه به سطح 10.<\/b><\/div>";
} else { $ff33 = "<a onclick=qst_next('','333')>اقامتگاه به سطح 10.<\/a>"; }

if ($database->getUserField($_SESSION['username'],'fquest','username')>=34){
$ff34 = "<div class=none><b>3 مهاجر.<\/b><\/div>";
} else { $ff34 = "<a onclick=qst_next('','334')>3 مهاجر.<\/a>"; }

if ($database->getUserField($_SESSION['username'],'fquest','username')>=35){
$ff35 = "<div class=none><b>دهکدۀ جدید.<\/b><\/div>";
} else { $ff35 = "<a onclick=qst_next('','335')>دهکدۀ جدید.<\/a>"; }


if($_SESSION['qst']== 24){ ?>

{"markup":"\n\t\t<div id=\"popup3\"><div><h4>مواردی که هنوز باید انجام شوند:<\/h4><ul><input type=\"hidden\" id=\"qst_val\" value=\"\"><li><?php echo $ff25;?><\/li><li><?php echo $ff26;?><\/li><li><?php echo $ff27;?><\/li><li><?php echo $ff28;?><\/li><li><?php echo $ff29;?><\/li><li><?php echo $ff30;?><\/li><li><?php echo $ff31;?><\/li><li><?php echo $ff32;?><\/li><li><?php echo $ff33;?><\/li><li><?php echo $ff34;?><\/li><li><?php echo $ff35;?><\/li><\/ul><\/div><\/div>\n\t\t\n\t\t","number":"-24","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}


<?php } elseif($_SESSION['qst']== 25){

$tRes = $database->getResourceLevel($session->villages[0]);
$ironL=0;$clayL=0;$woodL=0;$cropL=0;
if($tRes['f4']>1){$ironL++;};if($tRes['f7']>1){$ironL++;};if($tRes['f10']>1){$ironL++;};if($tRes['f11']>1){$ironL++;}
if($tRes['f5']>1){$clayL++;};if($tRes['f6']>1){$clayL++;};if($tRes['f16']>1){$clayL++;};if($tRes['f18']>1){$clayL++;}
if($tRes['f1']>1){$woodL++;};if($tRes['f3']>1){$woodL++;};if($tRes['f14']>1){$woodL++;};if($tRes['f17']>1){$woodL++;}
if($tRes['f2']>1){$cropL++;};if($tRes['f8']>1){$cropL++;};if($tRes['f9']>1){$cropL++;};if($tRes['f12']>1){$cropL++;};if($tRes['f13']>1){$cropL++;};if($tRes['f15']>1){$cropL++;}
if ($ironL<4 || $clayL<4 || $woodL<4 || $cropL<6){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>همه چیز به دو!	<\/h4><div class=\"spoken\">„دوباره وقت ارتقاء مزارع و معادن برای افزایش تولید منابع می باشد! اینبار سطح 1 کافی نیست... کمی طول خواهد کشید ولی در ارزشش را دارد. همۀ مزارع و معادن خود را به سطح 2 ارتقاء بده.”<\/div><div class=\"rew\"><p class=\"ta_aw\">دستور:<\/p>همه منابع را به سطح 2 برسان.<\/div><div class=\"rew\"><p class=\"ta_aw\">جایزه تو:<\/p><span class=\"resources gold\" alt=\"سکۀ طلای تراوین\"><img alt=\"سکۀ طلای تراوین\" class=\"gold\" src=\"img/x.gif\">15<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"javascript: qst_next('','24');\" class=\"qle arrow\">بازگشت به دیدکلی.<\/a><div class=\"clear\"><\/div><\/div><\/div>\n\t\t<div class=\"quest_res_all_two\" id=\"qstbg\"><\/div>\n\t\t","number":"-25","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>همه چیز به دو!	<\/h4><div class=\"spoken\">„عالی است! همۀ منابع به سطح 2 رسید...”<\/div><div class=\"rew\"><p class=\"ta_aw\">جایزه تو:<\/p><span class=\"resources gold\" alt=\"سکۀ طلای تراوین\"><img alt=\"سکۀ طلای تراوین\" class=\"gold\" src=\"img/x.gif\">15<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"#\" onclick=\"qst_next('','24')\" class=\"qle arrow\">بازگشت به دیدکلی.<\/a><a href=\"javascript: qst_next('','25');\" class=\"qri arrow\">اتمام وظیفه<\/a><div class=\"clear\"><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"quest_res_all_two\"><\/div>\n\t\t","number":25,"reward":{"gold":15},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 26){

$market = $building->getTypeLevel(17);
if ($market == 0){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>ساخت بازار سطح 1.<\/h4><div class=\"spoken\">„حال زمان بهبود اقتصاد دهکده است. یک بازار سطح 1 بساز.”<\/div><div class=\"rew\"><p class=\"ta_aw\">دستور:<\/p>یک بازار بساز.<\/div><div class=\"rew\"><p class=\"ta_aw\">جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">140<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">200<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">180<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img\/x.gif\" alt=\"گندم\">200<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"javascript: qst_next('','24');\" class=\"qle arrow\">بازگشت به دیدکلی.<\/a><div class=\"clear\"><\/div><\/div><\/div>\n\t\t<div class=\"quest_market_barracks1\" id=\"qstbg\"><\/div>\n\t\t","number":"-26","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>ساخت بازار سطح 1.<\/h4><div class=\"spoken\">„خوب است! حال اقتصاد دهکدۀ تو پیشرفت کرده است، از طریق بازار میتوانی با بازیکنان دیگر منابع مبادله کنی...”<\/div><div class=\"rew\"><p class=\"ta_aw\">جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">140<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">200<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">180<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img\/x.gif\" alt=\"گندم\">200<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"#\" onclick=\"qst_next('','24')\" class=\"qle arrow\">بازگشت به دیدکلی.<\/a><a href=\"javascript: qst_next('','26');\" class=\"qri arrow\">اتمام وظیفه<\/a><div class=\"clear\"><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"quest_market_barracks1\"><\/div>\n\t\t","number":26,"reward":{"wood":140,"clay":200,"iron":180,"crop":200},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 27){

$embassy = $building->getTypeLevel(18);
if ($embassy == 0){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>سفارت<\/h4><div class=\"spoken\">„دنیای تراوین خطرناک است. در حال حاضر تو یک مخفیگاه برای دفاع از خود در مقابل مهاجمین ساخته ای. اتحاد خوب حتی باعث خواهد شد بیشتر قادر به دفاع از خود باشی.<br><br>برای اینکه قادر به پذیرش دعوتنامۀ اتحادهای دیگر باشی، یک سفارت بنا کن.”<\/div><div class=\"rew\"><p class=\"ta_aw\">دستور:<\/p>یک سفارت بساز.<\/div><div class=\"rew\"><p class=\"ta_aw\">جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">200<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">120<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">180<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img\/x.gif\" alt=\"گندم\">80<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"javascript: qst_next('','24');\" class=\"qle arrow\">بازگشت به دیدکلی.<\/a><div class=\"clear\"><\/div><\/div><\/div>\n\t\t<div class=\"quest_dispatch\" id=\"qstbg\"><\/div>\n\t\t","number":"-27","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>سفارت<\/h4><div class=\"spoken\">„بسیار عالی! اکنون تو سفارت داری، به یک اتحادی برو و سعی کن عضو یک اتحاد بشوی...”<\/div><div class=\"rew\"><p class=\"ta_aw\">جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">200<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">120<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">180<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img\/x.gif\" alt=\"گندم\">80<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"#\" onclick=\"qst_next('','24')\" class=\"qle arrow\">بازگشت به دیدکلی.<\/a><a href=\"javascript: qst_next('','27');\" class=\"qri arrow\">اتمام وظیفه<\/a><div class=\"clear\"><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"quest_dispatch\"><\/div>\n\t\t","number":27,"reward":{"wood":200,"clay":120,"iron":180,"crop":80},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 28){

$aid = $session->alliance;
$allianceinfo = $database->getAlliance($aid);
if ($aid['alliance'] == 0){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>اتحاد<\/h4><div class=\"spoken\">„در تراوین همکاری بسیار مهم است. بازیکنانی که با هم کار می کنند قادر به سازماندهی خود در اتحاد هستند.<br><br>سعی کن اتحادی را راضی کنی که برای تو دعوتنامه ای ارسال کنند تا قادر به عضویت در آن باشی.<br>یا می توانی اتحاد خودت را بسازی. برای اینکار به سفارت سطح 3 نیاز خواهی داشت.”<\/div><div class=\"rew\"><p class=\"ta_aw\">دستور:<\/p>در اتحادی عضو شو و یا یک اتحاد برای خودت بساز.<\/div><div class=\"rew\"><p class=\"ta_aw\">جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">240<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">280<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">180<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img\/x.gif\" alt=\"گندم\">100<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"javascript: qst_next('','24');\" class=\"qle arrow\">بازگشت به دیدکلی.<\/a><div class=\"clear\"><\/div><\/div><\/div>\n\t\t<div class=\"quest_alliance\" id=\"qstbg\"><\/div>\n\t\t","number":"-28","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>اتحاد<\/h4><div class=\"spoken\">„خوب است! حالا تو در اتحادی به نام <b><?php echo $allianceinfo['tag']; ?><\/b> عضو هستی و میتوانی با کمک هم اتحادی های خود سریعتر پیشرفت کنی...”<\/div><div class=\"rew\"><p class=\"ta_aw\">جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">240<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">280<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">180<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img\/x.gif\" alt=\"گندم\">100<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"#\" onclick=\"qst_next('','24')\" class=\"qle arrow\">بازگشت به دیدکلی.<\/a><a href=\"javascript: qst_next('','28');\" class=\"qri arrow\">اتمام وظیفه<\/a><div class=\"clear\"><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"quest_alliance\"><\/div>\n\t\t","number":28,"reward":{"wood":240,"clay":280,"iron":180,"crop":100},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 29){

$mainbuilding = $building->getTypeLevel(15);
if ($mainbuilding < 5){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>ساختمان اصلی به سطح 5.<\/h4><div class=\"spoken\">„برای اینکه بتوانی قصر و یا اقامتگاه بسازی به ساختمان اصلی سطح 5 نیاز داری.”<\/div><div class=\"rew\"><p class=\"ta_aw\">دستور:<\/p>ساختمان اصلی خود را به سطح 5 ارتقاء بده.<\/div><div class=\"rew\"><p class=\"ta_aw\">جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">600<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">750<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">600<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img\/x.gif\" alt=\"گندم\">300<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"javascript: qst_next('','24');\" class=\"qle arrow\">بازگشت به دیدکلی.<\/a><div class=\"clear\"><\/div><\/div><\/div>\n\t\t<div class=\"quest_main_on_five\" id=\"qstbg\"><\/div>\n\t\t","number":"-29","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>ساختمان اصلی به سطح 5.<\/h4><div class=\"spoken\">„ساختمان اصلی به سطح 5 رسید، حال می توانی اقامتگاه یا قصر بنا کنی...”<\/div><div class=\"rew\"><p class=\"ta_aw\">جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">600<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">750<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">600<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img\/x.gif\" alt=\"گندم\">300<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"#\" onclick=\"qst_next('','24')\" class=\"qle arrow\">بازگشت به دیدکلی.<\/a><a href=\"javascript: qst_next('','29');\" class=\"qri arrow\">اتمام وظیفه<\/a><div class=\"clear\"><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"quest_main_on_five\"><\/div>\n\t\t","number":29,"reward":{"wood":600,"clay":750,"iron":600,"crop":300},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 30){

$granary = $building->getTypeLevel(11);
if ($granary < 3){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>انبار غذا به سطح 3.<\/h4><div class=\"spoken\">„برای اینکه گندم هدر نرود باید انبار غذای دهکده را ارتقاء بدی.”<\/div><div class=\"rew\"><p class=\"ta_aw\">دستور:<\/p>انبار غذای خود را به سطح 3 ارتقاء بده.<\/div><div class=\"rew\"><p class=\"ta_aw\">جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">900<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">850<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">600<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img\/x.gif\" alt=\"گندم\">300<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"javascript: qst_next('','24');\" class=\"qle arrow\">بازگشت به دیدکلی.<\/a><div class=\"clear\"><\/div><\/div><\/div>\n\t\t<div class=\"quest_granary_on_three\" id=\"qstbg\"><\/div>\n\t\t","number":"-30","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>انبار غذا به سطح 3.<\/h4><div class=\"spoken\">„انبار غذا به سطح 3 ارتقاء داده شد...”<\/div><div class=\"rew\"><p class=\"ta_aw\">جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">900<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">850<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">600<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img\/x.gif\" alt=\"گندم\">300<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"#\" onclick=\"qst_next('','24')\" class=\"qle arrow\">بازگشت به دیدکلی.<\/a><a href=\"javascript: qst_next('','30');\" class=\"qri arrow\">اتمام وظیفه<\/a><div class=\"clear\"><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"quest_granary_on_three\"><\/div>\n\t\t","number":30,"reward":{"wood":900,"clay":850,"iron":600,"crop":300},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 31){

$warehouse = $building->getTypeLevel(10);
if ($warehouse < 7){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>انبار به سطح 7.<\/h4><div class=\"spoken\">„برای اینکه منابع هدر نرود، باید انبار را ارتقاء دهی.”<\/div><div class=\"rew\"><p class=\"ta_aw\">دستور:<\/p>انبار خود را به سطح 7 ارتقاء بده.<\/div><div class=\"rew\"><p class=\"ta_aw\">جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">1800<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">2000<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">1650<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img\/x.gif\" alt=\"گندم\">800<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"javascript: qst_next('','24');\" class=\"qle arrow\">بازگشت به دیدکلی.<\/a><div class=\"clear\"><\/div><\/div><\/div>\n\t\t<div class=\"quest_warehouse_on_seven\" id=\"qstbg\"><\/div>\n\t\t","number":"-31","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>انبار به سطح 7.<\/h4><div class=\"spoken\">„انبار به سطح 7 ارتقاء داده شد...”<\/div><div class=\"rew\"><p class=\"ta_aw\">جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">1800<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">2000<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">1650<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img\/x.gif\" alt=\"گندم\">800<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"#\" onclick=\"qst_next('','24')\" class=\"qle arrow\">بازگشت به دیدکلی.<\/a><a href=\"javascript: qst_next('','31');\" class=\"qri arrow\">اتمام وظیفه<\/a><div class=\"clear\"><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"quest_warehouse_on_seven\"><\/div>\n\t\t","number":31,"reward":{"wood":1800,"clay":2000,"iron":1650,"crop":800},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 32){

//Check one of each resource is lvl5 or upper
$tRes = $database->getResourceLevel($session->villages[0]);
$ironL=0;$clayL=0;$woodL=0;$cropL=0;
if($tRes['f4']>4){$ironL++;};if($tRes['f7']>4){$ironL++;};if($tRes['f10']>4){$ironL++;};if($tRes['f11']>4){$ironL++;}
if($tRes['f5']>4){$clayL++;};if($tRes['f6']>4){$clayL++;};if($tRes['f16']>4){$clayL++;};if($tRes['f18']>4){$clayL++;}
if($tRes['f1']>4){$woodL++;};if($tRes['f3']>4){$woodL++;};if($tRes['f14']>4){$woodL++;};if($tRes['f17']>4){$woodL++;}
if($tRes['f2']>4){$cropL++;};if($tRes['f8']>4){$cropL++;};if($tRes['f9']>4){$cropL++;};if($tRes['f12']>4){$cropL++;};if($tRes['f13']>4){$cropL++;};if($tRes['f15']>4){$cropL++;}
if ($ironL<4 || $clayL<4 || $woodL<4 || $cropL<6){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>همه چیز به 5.<\/h4><div class=\"spoken\">„همیشه به منابع نیاز خواهی داشت. هزینۀ ارتقاء معادن و مزارع زیاد هست ولی در دراز مدت ارزشش را خواهد داشت.”<\/div><div class=\"rew\"><p class=\"ta_aw\">دستور:<\/p>تمامی مزارع و معادن دهکده را به سطح 5 ارتقاء بده.<\/div><div class=\"rew\"><p class=\"ta_aw\">جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">1600<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">1800<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">1950<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img\/x.gif\" alt=\"گندم\">1200<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"javascript: qst_next('','24');\" class=\"qle arrow\">بازگشت به دیدکلی.<\/a><div class=\"clear\"><\/div><\/div><\/div>\n\t\t<div class=\"quest_res_all_five\" id=\"qstbg\"><\/div>\n\t\t","number":"-32","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>همه چیز به 5.<\/h4><div class=\"spoken\">„همۀ منابع به سطح 5 شدند، اکنون تولیدات دهکده بالا رفته و یک قدم پیشرفت کردید...”<\/div><div class=\"rew\"><p class=\"ta_aw\">جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">1600<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">1800<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">1950<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img\/x.gif\" alt=\"گندم\">1200<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"#\" onclick=\"qst_next('','24')\" class=\"qle arrow\">بازگشت به دیدکلی.<\/a><a href=\"javascript: qst_next('','32');\" class=\"qri arrow\">اتمام وظیفه<\/a><div class=\"clear\"><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"quest_res_all_five\"><\/div>\n\t\t","number":32,"reward":{"wood":1600,"clay":1800,"iron":1950,"crop":1200},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 33){

$residence = $building->getTypeLevel(25);
if ($residence<10){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>قصر یا اقامتگاه به سطح 10.<\/h4><div class=\"spoken\">„برای بنای دهکدۀ جدید به مهاجر نیاز داری. مهاجر را می توانی در قصر و یا اقامتگاه تربیت کنی.”<\/div><div class=\"rew\"><p class=\"ta_aw\">دستور:<\/p>اقامتگاه ساخته و سطح آن را به 10 برسان.<\/div><div class=\"rew\"><p class=\"ta_aw\">جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">3400<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">2800<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">3600<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img\/x.gif\" alt=\"گندم\">2200<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"javascript: qst_next('','24');\" class=\"qle arrow\">بازگشت به دیدکلی.<\/a><div class=\"clear\"><\/div><\/div><\/div>\n\t\t<div class=\"quest_palace_or_residence\" id=\"qstbg\"><\/div>\n\t\t","number":"-33","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>قصر یا اقامتگاه به سطح 10.<\/h4><div class=\"spoken\">„اقامتگاه به سطح 10 رسید، حالا میتوانید مهاجر بسازید و دهکدۀ دوم خود را بنا کنید.<br><br>به امتیاز فرهنگی خود دقت کنید...”<\/div><div class=\"rew\"><p class=\"ta_aw\">جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">3400<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">2800<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">3600<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img\/x.gif\" alt=\"گندم\">2200<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"#\" onclick=\"qst_next('','24')\" class=\"qle arrow\">بازگشت به دیدکلی.<\/a><a href=\"javascript: qst_next('','33');\" class=\"qri arrow\">اتمام وظیفه<\/a><div class=\"clear\"><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"quest_palace_or_residence\"><\/div>\n\t\t","number":33,"reward":{"wood":3400,"clay":2800,"iron":3600,"crop":2200},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 34){

// Checking 3 settlers trained or no
$units = $village->unitall;
$unarray2=array("","u10", "u20","u30");
if ($units[$unarray2[$session->userinfo['tribe']]]<3){ ?>

{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>3 مهاجر.<\/h4><div class=\"spoken\">„برای بنای دهکدۀ جدید به مهاجر نیاز داری. مهاجر را می توانی در قصر و یا اقامتگاه تربیت کنی.”<\/div><div class=\"rew\"><p class=\"ta_aw\">دستور:<\/p>3 مهاجر تربیت کن.<\/div><div class=\"rew\"><p class=\"ta_aw\">جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">1050<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">800<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">900<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img\/x.gif\" alt=\"گندم\">750<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"javascript: qst_next('','24');\" class=\"qle arrow\">بازگشت به دیدکلی.<\/a><div class=\"clear\"><\/div><\/div><\/div>\n\t\t<div class=\"quest_three_settlers\" id=\"qstbg\"><\/div>\n\t\t","number":"-34","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>3 مهاجر.<\/h4><div class=\"spoken\">„3 مهاجر ساخته شد.<br><br>برای بنا کردن دهکدۀ جدید شما به 2000 امتیاز فرهنگی نیاز دارید...”<\/div><div class=\"rew\"><p class=\"ta_aw\">جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">1050<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">800<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">900<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img\/x.gif\" alt=\"گندم\">750<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"#\" onclick=\"qst_next('','24')\" class=\"qle arrow\">بازگشت به دیدکلی.<\/a><a href=\"javascript: qst_next('','34');\" class=\"qri arrow\">اتمام وظیفه<\/a><div class=\"clear\"><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"quest_three_settlers\"><\/div>\n\t\t","number":34,"reward":{"wood":1050,"clay":800,"iron":900,"crop":750},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 35){

$vil = $database->getProfileVillages($session->uid);
if (count($vil)<2){ ?>

{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>دهکدۀ جدید.<\/h4><div class=\"spoken\">„خانه های خالی زیادی در نقشه موجود است. خانه ای پیدا کن که برای تو خوب باشد و در آن دهکدۀ جدیدی بنا کن.”<\/div><div class=\"rew\"><p class=\"ta_aw\">دستور:<\/p>یک دهکدۀ جدید بنا کن.<\/div><div class=\"rew\"><p class=\"ta_aw\">جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">1600<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">2000<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">1800<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img\/x.gif\" alt=\"گندم\">1300<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"javascript: qst_next('','24');\" class=\"qle arrow\">بازگشت به دیدکلی.<\/a><div class=\"clear\"><\/div><\/div><\/div>\n\t\t<div class=\"quest_new_village\" id=\"qstbg\"><\/div>\n\t\t","number":"-35","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>دهکدۀ جدید.<\/h4><div class=\"spoken\">„تبریک میگویم<br><br>شما همۀ وظایف را پشت سر گذاشتید، اکنون باید به تنهایی ادامه دهید.<br><br>خداحافظ...”<\/div><div class=\"rew\"><p class=\"ta_aw\">جایزه تو:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"چوب\" src=\"img\/x.gif\" alt=\"چوب\">1600<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"خشت\" src=\"img\/x.gif\" alt=\"خشت\">2000<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"آهن\" src=\"img\/x.gif\" alt=\"آهن\">1800<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"گندم\" src=\"img\/x.gif\" alt=\"گندم\">1300<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"#\" onclick=\"qst_next('','24')\" class=\"qle arrow\">بازگشت به دیدکلی.<\/a><a href=\"javascript: qst_next('','35');\" class=\"qri arrow\">اتمام وظیفه<\/a><div class=\"clear\"><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"quest_new_village\"><\/div>\n\t\t","number":35,"reward":{"wood":1600,"clay":2000,"iron":1800,"crop":1300},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>




// End tasks message
<?php } ?>
