<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>

<div class "form-row">
<form method="get" action="/main" class="form-inline">
    <input type="text" name="filter" value="${filter?ifExists}" placeholder = "Пошук постів за тегом">
    <button type="submit" class="btn btn-primary ml-2"> Пошук</button>
</form>

<a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Додати нове повідомлення
</a>

<div class="collapse" id="collapseExample">
    <div class="form-group mt-3">

        <form method="post" enctype="multipart/form-data">

            <div class="form-group">
                <input type="text" class="form-control" name="text" placeholder="Введіть повідомлення">
            </div>

            <div class="form-group">
                <input type="text"class="form-control" name="tag" placeholder="Тег">
            </div>

            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file" id ="customFile">
                    <label class="custom-file-label" for="customFile"> Виберіть фото, якщо потрібно
                </div>
            </div>

            <div class="form-group">
                <small class="form-text text-muted">Ваш пост буде опублікований у стрічці новин після успішної перевірки модератором сайту.</small>
            </div>

            <div class="form-group">
                <button type="submit" class="btn btn-primary"> НАДІСЛАТИ</button>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        </form>
    </div>

</div>

<div class="card-columns">

    <#list posts as message>
        <div class="card my-3" style="width: 18rem;">

            <#if message.filename??>
                <img src="/img/${message.filename}" class="card-img-top" width="250dp" height="250dp" ">
            </#if>

            <div class="m-2">
                <span>${message.text}</span>
            </div>

            <i>${message.tag}</i>

            <div class="card-footer text-muted">
            ${message.authorName}
            </div>

        </div>
    <#else>
        No posts
    </#list>
</div>
</@c.page>