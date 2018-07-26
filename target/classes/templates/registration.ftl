<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>

${user?ifExists}
<div class="mb-1">Add new user</div>
    <@l.login "/registration" true/>
</@c.page>