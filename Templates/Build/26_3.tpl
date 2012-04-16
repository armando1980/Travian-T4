<h1 class="titleInHeader">قصر <span class="level">سطح <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid26">
<div class="build_desc">
	<a href="#" onClick="return Travian.Game.iPopup(26,4, 'gid');" class="build_logo"> 
    <img class="building big white g26" src="img/x.gif" alt="قصر" title="قصر" /> </a>
	در قصر شاه و ملکه امپراطوری زندگی می کنند. شما در کل امپراطوری فقط یک قصر می توانید داشته باشید. فقط دهکده ای که قصر شما در آن است را می توانید به پایتخت خود تبدیل کنید (شما نمی توانید در یک دهکده قصر و اقامتگاه را با هم داشته باشید).</div>


<?php 
include("upgrade.tpl");
include("26_menu.tpl"); 
?>
می توانید با حمله ای که در آن از سناتور/رئیس قبیله/رئیس استفاده شده است وفاداری دهکده را کاهش داد. اگر وفاداری به 0 برسد دهکده از آن مهاجم خواهد شد. وفاداری این دهکده در حال حاضر <b><?php echo $database->getVillageField($village->wid, 'loyalty'); ?></b>% می باشد.</div>