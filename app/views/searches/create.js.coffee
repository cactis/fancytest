$data = $("<%= j render :partial => '/searches/skill', :collection => @skills %>")
$data.hide()
$("#skills_list").html($data)
$data.fadeIn(1000)
