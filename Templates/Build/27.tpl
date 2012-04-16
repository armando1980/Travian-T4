<h1 class="titleInHeader">خزانه <span class="level">سطح <?php echo $village->resarray['f'.$id]; ?></span></h1>

    <div id="build" class="gid27">
    <div class="build_desc">
        <a href="#" onClick="return Travian.Game.iPopup(27,4);" class="build_logo">
        <img class="building big white g27" src="img/x.gif" alt="خزانه" title="خزانه"></a>
        ثروت امپراطوری شما در خزانه نگهداری می شود. خزانه تنها برای یک کتیبه جا دارد. براي نگهداري كتيبه كوچك شما به خزانه سطح 10 و براي نگهداري كتيبه بزرگ و يا منحصر به فرد شما به خزانه سطح 20 نياز خواهيد داشت. فعال شدن کتیبه در سرورهای معمولی 24 ساعت و در سرور اسپید 12 ساعت طول خواهد کشید.</div>
        <?php
        include("upgrade.tpl");
        include("27_menu.tpl");
        if(isset($_GET['show'])){  include("27_show.tpl");  }else{
        if(!isset($_GET['t'])){
            include("27_1.tpl");     
        }elseif(isset($_GET['t']) && $_GET['t'] == 2){
            include("27_2.tpl"); 
        }elseif(isset($_GET['t']) && $_GET['t'] == 3){
            include("27_3.tpl");
        }
        }
        
        
        ?>
    </div>