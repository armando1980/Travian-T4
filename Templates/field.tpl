                                <map name="rx" id="rx">
                                <?php 
    $coorarray = array(1=>"310,88,28","220,89,28","152,101,28","368,127,28","255,140,28","198,147,28","113,145,28","428,178,28","347,179,28","157,179,28","70,179,28","420,239,28","347,229,28","211,265,28","89,234,28","316,319,28","225,324,28","135,301,28");
        for($i=1;$i<=18;$i++) {
            echo "<area href=\"build.php?id=$i\" coords=\"$coorarray[$i]\" shape=\"circle\" title=\"<div style=color:#FFF><b>".$building->procResType($village->resarray['f'.$i.'t'])."</b></div> سطح ".$village->resarray['f'.$i]."\"/>";
        }
    ?>
<area href="dorf2.php" coords="250,191,32" shape="circle" title="ساختمان ها">
</map>

<div id="village_map" class="f<?php echo $village->type; ?>">
    <div id="village_circles"></div>

<?php 
for($i=1;$i<=18;$i++) {
    if($village->resarray['f'.$i.'t'] != 0) {
    $text = "";
    switch($i) {
    case 1:
    $style = "right:180px;top:80px;";
    break;
    case 2:
    $style = "right:269px;top:81px;";
    break;
    case 3:
     $style = "right:338px;top:93px;";
    break;
    case 4:
    $style = "right:122px;top:119px;";
    break;
    case 5:
    $style = "right:235px;top:132px;";
    break;
    case 6:
    $style = "right:292px;top:139px;";
    break;
    case 7:
     $style = "right:377px;top:137px;";
    break;
    case 8:
    $style = "right:62px;top:170px;";
    break;
    case 9:
    $style = "right:143px;top:171px;";
    break;
    case 10:
    $style = "right:333px;top:171px;";
    break;
    case 11:
    $style = "right:420px;top:171px;";
    break;
    case 12:
    $style = "right:70px;top:231px;";
    break;
    case 13:
    $style = "right:143px;top:221px;";
    break;
    case 14:
     $style = "right:279px;top:257px;";
    break;
    case 15:
    $style = "right:401px;top:226px;";
    break;
    case 16:
    $style = "right:174px;top:311px;";
    break;
    case 17:
    $style = "right:265px;top:316px;";
    break;
    case 18:
    $style = "right:355px;top:293px;";
    break;
    }
    if($village->resarray['f'.$i] != 0) {
    echo "<div class=level style=\"".$style." ".$cstyle."\">".$village->resarray['f'.$i]."</div> ";
    }
    }
   }
  ?>     



    <img id="resfeld" usemap="#rx" src="img/x.gif" alt="">

</div> 