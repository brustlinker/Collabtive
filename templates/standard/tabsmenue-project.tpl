
<div class="tabswrapper">
	<ul class="tabs">
		<li class="projects"><a {if $projecttab|default == "active" }class="active"{/if} href="manageproject.php?action=showproject&amp;id={$project.ID}"><span>{#project#}</span></a></li>

		<li class="miles"><a {if $milestab|default == "active" }class="active"{/if} href="managemilestone.php?action=showproject&amp;id={$project.ID}"><span>{#milestones#}</span></a></li>

		<li class="tasks"><a {if $taskstab|default == "active" }class="active"{/if} href="managetask.php?action=showproject&amp;id={$project.ID}"><span>{#tasklists#}</span></a></li>
		<li class="msgs"><a {if $msgstab|default == "active" }class="active"{/if} href="managemessage.php?action=showproject&amp;id={$project.ID}"><span>{#messages#}</span></a></li>
		<li class="files"><a {if $filestab|default == "active" }class="active"{/if} href="managefile.php?action=showproject&amp;id={$project.ID}"><span>{#files#}</span></a></li>
		<li class="user"><a {if $userstab|default == "active" }class="active"{/if} href="manageuser.php?action=showproject&amp;id={$project.ID}"><span>{#user#}</span></a></li>
		<li class="timetrack"><a {if $timetab|default == "active" }class="active"{/if} href="managetimetracker.php?action=showproject&amp;id={$project.ID}"><span>{#timetracker#}</span></a></li>
	</ul>
</div>