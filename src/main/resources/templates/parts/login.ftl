<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group">
            <label>Логін: </label>
            <input type="text" name="username" class="form-control" placeholder="Введіть логін"/>
        </div>
        <div class="form-group">
            <label>Пароль: </label>
                <input type="password" name="password" class="form-control" placeholder="Введіть пароль"/>
        </div>

        <#if isRegisterForm>
        <div class="form-group">
            <label>Email: </label>
            <input type="email" name="email" class="form-control" placeholder="some@some.com"/>
        </div>
        </#if>

            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <button type="submit" class="btn btn-primary"><#if isRegisterForm> Зареєструватись<#else> Вхід </#if></button>
            <#if !isRegisterForm><a href="/registration">Зареєструватись</a></#if>
        </div>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-primary"> Вихід</button>
    </form>
</#macro>