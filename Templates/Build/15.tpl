<h1 class="titleInHeader">ساختمان اصلی <span class="level">سطح <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid15">
<div class="build_desc">
<a href="#" onClick="return Travian.Game.iPopup(15,4);" class="build_logo">
<img class="building big white g15" src="img/x.gif" alt="ساختمان اصلی" title="ساختمان اصلی" />
</a>معماران دهکدۀ شما در ساختمان اصلی دهکده زندگی می کنند. هر قدر سطح آن بالا باشد سرعت ساخت ساختمان ها و ارتقاء آنها نیز بیشتر خواهد شد.</div>


	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>زمان ساخت فعلی:</th>
			<td><b><?php echo round($bid15[$village->resarray['f'.$id]]['attri']); ?></b> درصد</td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
			<th>زمان ساخت در سطح <?php echo $village->resarray['f'.$id]+1; ?>:</th>
			<td><b><?php echo round($bid15[$village->resarray['f'.$id]+1]['attri']); ?></b> درصد</td>
            <?php
            }
            ?>
		</tr>
	</table>
	
<?php 
include("upgrade.tpl");
if($village->resarray['f'.$id] >= 10){
	include("Templates/Build/15_1.tpl");
}
?>
</p></div>
