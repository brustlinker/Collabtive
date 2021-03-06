<div class="msgs" id="projectMessages"  v-cloak >
    <div class="headline" >
        <a href="javascript:void(0);" id="acc-toggle" class="win_block" onclick="toggleBlock('block_msgs');"></a>
        <div class="wintools">
            <div class="progress display-none" id="progressprojectMessages" style="width:20px;float:left">
                <img src="templates/{$settings.template}/theme/{$settings.theme}/images/symbols/loader-messages.gif"/>
            </div>
            <div class="export-main">
                <a class="export"><span>{#export#}</span></a>

                <div class="export-in" style="width:46px;left: -46px;"> {*at one item*}
                    <a class="pdf" href="managemessage.php?action=export-project&amp;id={$project.ID}"><span>{#pdfexport#}</span></a>
                    <a class="rss" href="managerss.php?action=mymsgs-rss&amp;user={$userid}"><span>{#rssfeed#}</span></a>
                </div>
            </div>
        </div>

        <h2>
            <img src="./templates/{$settings.template}/theme/{$settings.theme}/images/symbols/msgs.png" alt=""/>{#messages#}
            <pagination view="projectMessagesView" :pages="pages" :current-page="currentPage"></pagination>
        </h2>
    </div>

    <div id="block_msgs" class="block">
        {*Add Message*}
        <div id="addmsg" class="addmenue display-none">
            {include file="addmessageform.tpl" }
        </div>
        <div class="nosmooth" id="sm_msgs">
            <table id="acc_msgs" cellpadding="0" cellspacing="0" border="0">
                <thead>
                <tr>
                    <th class="a"></th>
                    <th class="b">{#message#}</th>
                    <th class="ce" class="text-align-right">{#replies#}&nbsp;&nbsp;</th>
                    <th class="de">{#by#}</th>
                    <th class="e">{#on#}</th>
                    <th class="tools"></th>
                </tr>
                </thead>

                <tfoot>
                <tr>
                    <td colspan="6"></td>
                </tr>
                </tfoot>
                {literal}
                <tbody v-for="message in items" class="alternateColors" id="msgs_{{*message.ID}}">
                <tr>
                    <td>
                        {/literal}
                        {if $userpermissions.messages.close}
                        {literal}
                            <a class="butn_reply" href="javascript:void(0);" onclick="change('managemessage.php?action=replyform&amp;mid={{*message.ID}}&amp;id={{*message.project}}','addmsg');toggleClass(this,'butn_reply_active','butn_reply');blindtoggle('addmsg');" title="{/literal}{#edit#}"></a>
                        {/if}
                    </td>
                    {literal}
                    <td>
                        <div class="toggle-in">
                                    <span class="acc-toggle"
                                          onclick="javascript:accord_messages.toggle(css('#block_msgs_content{{$index}}'));"></span>
                            <a href="managemessage.php?action=showmessage&amp;mid={{*message.ID}}&amp;id={{*message.project}}"
                               title="{{*message.title}}">{{*message.title | truncate '30' }}</a>
                        </div>
                    </td>
                    <td class="text-align-right">
                        <a href="managemessage.php?action=showmessage&amp;mid={{*message.ID}}&amp;id={{*message.project}}#replies">{{*message.replies}}</a>
                        &nbsp;
                    </td>
                    <td><a href="manageuser.php?action=profile&amp;id={{message.user}}">{{*message.username}}</a></td>
                    <td>{{*message.postdate}}</td>
                    <td class="tools">
                        {/literal}
                        {if $userpermissions.messages.edit}
                        {literal}
                            <a class="tool_edit" href="javascript:void(0);" onclick="change('managemessage.php?action=editform&amp;mid={{*message.ID}}&amp;id={{*message.project}}','addmsg');toggleClass(this,'tool_edit_active','tool_edit');blindtoggle('addmsg');" title="{/literal}{#edit#}"></a>
                        {/if}
                        {if $userpermissions.messages.del}
                        {literal}
                            <a class="tool_del" href="javascript:confirmDelete('{/literal}{#confirmdel#}{literal}','msgs_{{*message.ID}}','managemessage.php?action=del&amp;mid={{*message.ID}}&amp;id={{*message.project}}',projectMessagesView);"  title="{/literal}{#delete#}"></a>
                        {/if}
                        {literal}
                    </td>
                </tr>

                <tr class="acc">
                    <td colspan="6">
                        <div class="accordion_content">
                            <div class="acc-in">
                                <img src="thumb.php?width=80&amp;height=80&amp;pic=templates/{/literal}{$settings.template}/theme/{$settings.theme}{literal}/images/no-avatar-male.jpg"/>

                                <div class="message-fluid">
                                    <div class="message-in-fluid">
                                        {{{*message.text}}}
                                    </div>

                                    <!-- message milestones -->
                                    <p v-if="message.hasMilestones">

                                    <div v-if="message.hasMilestones" class="content-spacer-b"></div>
                                    <strong v-if="message.hasMilestones">{/literal}{#milestone#}{literal}:</strong>
                                    <a v-if="message.hasMilestones"
                                       href="managemilestone.php?action=showmilestone&amp;msid={{*message.milestones.ID}}&amp;id={{*message.milestones.project}}">{{*message.milestones.name}}</a>
                                    </p>
                                    <!-- message files -->
                                    <p v-if="message.hasFiles" class="tags-miles">
                                        <strong>{/literal}{#files#}:{literal}</strong>
                                    </p>
                                    <div v-if="message.hasFiles" class="inwrapper">
                                        <ul>
                                            <li v-for="file in message.files" id="fli_{{*file.ID}}">
                                                <div class="itemwrapper">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tr>
                                                            <td class="leftmen" valign="top">
                                                                <div class="inmenue"></div>
                                                            </td>
                                                            <td class="thumb">
                                                                {/literal}
                                                                <img src="templates/{$settings.template}/theme/{$settings.theme}/images/files/{literal}{{*file.type}}.png"
                                                                     alt=""/>
                                                                </a>
                                                            </td>
                                                            {/literal}
                                                            <td class="rightmen" valign="top">
                                                                <div class="inmenue">
                                                                    {if $userpermissions.files.del}
                                                                    {literal}
                                                                        <a class="del" href="javascript:confirmfunction
																					('{/literal}{$langfile.confirmdel}{literal}','deleteElement(\'fli_{{file.ID}}\',\'managefile.php?action=delete&id={{*message.project}}&file={{file.ID}}\')');" title="{/literal}{#delete#}"></a>
                                                                    {/if}
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        {literal}
                                                        <tr>
                                                            <td colspan="3">
                                                                <span class="name">
                                                                    <a href="managefile.php?action=downloadfile&amp;id={{*file.project}}&amp;file={{*file.ID}}">
                                                                        {{*file.shortName}}
                                                                    </a>
                                                                </span>
                                                            </td>
                                                        <tr/>
                                                    </table>
                                                </div>
                                                <!-- itemwrapper End -->
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- inwrapper End -->
                                    <div class="clear_both"></div>
                                </div>
                                <!-- div messages end -->
                            </div>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <!--smooth End-->

        <div class="tablemenue">
            <div class="tablemenue-in">
                {/literal}
                {if $userpermissions.messages.add}
                    <a class="butn_link" href="javascript:blindtoggle('addmsg');" id="add_butn"
                       onclick="toggleClass(this,'butn_link_active','butn_link');toggleClass('sm_msgs','smooth','nosmooth');">{#addmessage#}</a>
                {/if}

            </div>
        </div>
    </div>
    <!-- block END  -->
    <div class="content-spacer"></div>

</div>
<!-- Msgs END-->