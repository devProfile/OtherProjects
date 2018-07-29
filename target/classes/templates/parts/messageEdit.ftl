<a href="#collapseExample" data-toggle="collapse" class="btn btn-primary" role="button" aria-expanded="false" aria-controls="collapseExample">
    Message editor
</a>
<div class="collapse <#if message??>show</#if>" id="collapseExample">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input class="form-control ${(textError??)?string('is-invalid', '')}"
                       value="<#if message??>${message.text}</#if>" type="text" name="text" placeholder="Enter text">
                <#if textError??>
                <div class="invalid-feedback">
                    ${textError}
                </div>
                </#if>
            </div>
            <div class="form-group">

                <input class="form-control ${(tagError??)?string('is-invalid', '')}" value="<#if message??>${message.tag}</#if>" type="text" name="tag" placeholder="Enter tag">
            <#if tagError??>
                <div class="invalid-feedback">
                    ${tagError}
                </div>
            </#if>
            </div>
            <div class="form-group">

                <div class="custom-file">

                    <input type="file" name="file" id="customFile">
                    <label for="customFile" class="custom-file-label">Choose file</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="hidden" name="id" value="<#if message??>${message.id}</#if>">
            <div class="form-group">

                <button type="submit" class="btn btn-primary">Save</button>
            </div>
        </form>
    </div>
</div>