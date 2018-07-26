<#import "parts/common.ftl" as c>

<@c.page>

<div class="form-row">
    <div class="form-group col-md-6">
        <form method="get" action="/main" >
            <input type="text" name="filter" value="${filter?ifExists}" placeholder="Search by tag">
            <button type="submit" class="btn btn-primary ml-2">Search</button>
        </form>
    </div>

</div>
<a href="#collapseExample" data-toggle="collapse" class="btn btn-primary" role="button" aria-expanded="false" aria-controls="collapseExample">
    Add new Message
</a>
<div class="collapse" id="collapseExample">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input class="form-control" type="text" name="text" placeholder="Enter text">
            </div>
            <div class="form-group">

                <input class="form-control" type="text" name="tag" placeholder="Enter tag">
            </div>
            <div class="form-group">

                <div class="custom-file">

                    <input type="file" name="file" id="customFile">
                    <label for="customFile" class="custom-file-label">Choose file</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <div class="form-group">

                <button type="submit" class="btn btn-primary">Add</button>
            </div>
        </form>
    </div>
</div>
<div class="card-columns">
    <#list some as one>
        <div class="card my-3">
            <#if one.filename??>
                <img src="/img/${one.filename}" class="card-img-top">
            </#if>
            ${one.tag} <div class="m-2">${one.text}</div> <div class="card-footer text-muted">${one.authorName}</div>
        </div>
    </#list>



</div>
</@c.page>