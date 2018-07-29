<#include "security.ftl">
<div class="card-columns">
    <#list messages as one>
        <div class="card my-3">
            <#if one.filename??>
                <img src="/img/${one.filename}" class="card-img-top">
            </#if>
            #${one.tag} <div class="m-2">${one.text}</div> <div class="card-footer text-muted"><a href="/user-messages/${one.author.id}">${one.authorName}</a>
            <#if one.author.id == currentUserId>
            <a href="/user-messages/${one.author.id}?message=${one.id}" class="btn btn-primary">Edit</a>
            </#if>
            </div>
        </div>
    </#list>
</div>
