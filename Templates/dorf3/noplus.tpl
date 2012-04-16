<div class="contentNavi subNavi">
				<div class="container active">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="dorf3.php"><span class="tabItem">دید کلی</span></a></div>
				</div>
				<div class="container normal">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><span class="tabItem">منابع</span></div>
				</div>
				<div class="container normal">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><span class="tabItem">انبار</span></div>
				</div>
				<div class="container normal">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><span class="tabItem">امتیاز فرهنگی</span></div>
				</div>
				<div class="container normal">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><span class="tabItem">لشکریان</span></div>
				</div><div class="clear"></div>
</div>
<table cellpadding="1" cellspacing="1" id="overview">
<thead>
<tr>
	<td>دهکده</td>
	<td>حمله ها</td>
	<td>ساختمان</td> 
	<td>لشکریان</td>
	<td>تاجرها</td>
</tr></thead><tbody>
<?php
$varray = $database->getProfileVillages($session->uid);  
foreach($varray as $vil){  
  $vid = $vil['wref'];
  $vdata = $database->getVillage($vid);
  if($vdata['capital'] == 1){$class = 'hl';}else{$class = '';}
  echo '
  <tr class="'.$class.'">
		   <td class="vil fc"><a href="dorf1.php?newdid='.$vid.'">'.$vdata['name'].'</a></td>
		   <td class="att"><span class="none">?</span></td>
		   <td class="bui"><span class="none">?</span></td> 
		   <td class="tro"><span class="none">?</span></td>
		   <td class="tra lc"><a href="build.php?gid=17">?/?</a></td>
	</tr> 
  ';
}
?>   
     </tbody>
</table>