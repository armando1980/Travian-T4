<h1 class="titleInHeader">دیوار شهر <span class="level">سطح <?php echo $village->resarray['f'.$id]; ?></span></h1>

    <div id="build" class="gid31">
    <div class="build_desc">
        <a href="#" onClick="return Travian.Game.iPopup(31,4);" class="build_logo">
        <img class="building big white g31" src="img/x.gif" alt="دیوار شهر" title="دیوار شهر"></a>
        این ساختمان قدرت محافظت شما در برابر حملات دشمن را بیشتر خواهد کرد. هر قدر سطح آن بیشتر باشد قدرت دفاعی لشکریان شما نیز بیشتر خواهد شد.</div>

<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>امتیاز دفاعی فعلی:</th>
			<td><b><?php echo $bid31[$village->resarray['f'.$id]]['attri']; ?></b>%</td>
		</tr><tr>
        <?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
			<th>امتیاز دفاعی در سطح <?php echo $village->resarray['f'.$id]+1; ?>:</th>

			<td><b><?php echo $bid31[$village->resarray['f'.$id]+1]['attri']; ?></b>%</td>
            <?php
            }
            ?>
		</tr></table>
<?php 
include("upgrade.tpl");
?>
        </p>
         </div>