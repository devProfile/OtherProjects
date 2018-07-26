<#import "parts/common.ftl" as c>
<@c.page>
List of users
<table>
    <thread>
        <tr>
            <th>Name</th>
            <th>Role</th>
            <th></th>
        </tr>
    </thread>
    <tbody>
<#list users as user>
<tr>
    <th>${user.username}</th>
    <th><#list user.roles as role>${role}<#sep>, </#list></th>
    <th><a href="/user/${user.id}">Edit</a></th>
</tr>
</#list>
    </tbody>
</table>
</@c.page>