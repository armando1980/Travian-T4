<h1 class="titleInHeader">انبار <span class="level">سطح <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid10">
<div class="build_desc">
<a href="#" onclick="return Travian.Game.iPopup(10,4, 'gid');" class="build_logo">
<img class="building big white g10" src="img/x.gif" alt="انبار">
</a>
آهن, چوب و خشت، در انبار ذخیره میشوند. با ارتقاء سطح آن ظرفیت آن بیشتر شده و قادر به ذخیرۀ بیشتر منابع خواهید بود.</div>

	<table cellpadding="1" cellspacing="1" id="build_value">
    <tr>
			<th>ظرفیت فعلی:</th>
			<td>از هر منبع <b><?php echo $bid10[$village->resarray['f'.$id]]['attri']; ?></b> واحد</td>
		</tr>
    	<tr>
        <?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
			<th>ظرفیت در سطح <?php echo $village->resarray['f'.$id]+1; ?>:</th>
			<td>از هر منبع <b><?php echo $bid10[$village->resarray['f'.$id]+1]['attri']; ?></b> واحد</td>
        <?php
        }
        ?>
	</tr>
	</table>
 <?php 
include("upgrade.tpl");
?>
</p></div>