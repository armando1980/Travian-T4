<h1 class="titleInHeader">آجرپزی <span class="level">سطح <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid6">
<div class="build_desc">
<a href="#" onClick="return Travian.Game.iPopup(6,4);" class="build_logo">
	<img class="building big white g6" src="img/x.gif" alt="آجرپزی" title="آجرپزی" />
</a>
در آجرپزی از خشت خام، آجر ساخته می‌شود که می‌تواند تولید را 

تا سقف 25% افزایش دهد.</div>


	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>افزایش تولید فعلی:</th>
			<td><b><?php echo $bid6[$village->resarray['f'.$id]]['attri']; ?></b>%</td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
			<th>افزایش تولید در سطح <?php echo $village->resarray['f'.$id]+1; ?>:</th>
			<td><b><?php echo $bid6[$village->resarray['f'.$id]+1]['attri']; ?></b>%</td>
            <?php
            }
            ?>
		</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>