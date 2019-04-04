<#import "/spring.ftl" as spring />
<#import "/macros/thub.ftl" as teamhub />
<#import "/macros/security.ftl" as security />

<content tag="fullWidth"></content>

<head>
    <title><@teamhub.setting key="site.title"/></title>
</head>

<body>
    <div class="category-box col-md-3 col-sm-6 col-xs-12">
        <a class="category-box__link" href="/questions/index.html">
            <div class="category-box__icon">
                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="70" height="70" viewBox="0 0 70 70">

                    <defs>
                        <circle id="b" cx="26" cy="26" r="26"></circle>
                        <filter id="a" width="157.7%" height="157.7%" x="-28.8%" y="-23.1%" filterUnits="objectBoundingBox">
                            <feMorphology in="SourceAlpha" operator="dilate" radius="1" result="shadowSpreadOuter1"></feMorphology>
                            <feOffset dy="3" in="shadowSpreadOuter1" result="shadowOffsetOuter1"></feOffset>
                            <feGaussianBlur in="shadowOffsetOuter1" result="shadowBlurOuter1" stdDeviation="3.5"></feGaussianBlur>
                            <feColorMatrix in="shadowBlurOuter1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.1 0"></feColorMatrix>
                        </filter>
                        <linearGradient id="collect" x1="90%" y1="90%" x2="10%" y2="10%">
                            <stop offset="0%" style="stop-color:rgb(163,228,209);stop-opacity:1"></stop>
                            <stop offset="100%" style="stop-color:rgb(74,196,211);stop-opacity:1"></stop>
                        </linearGradient>
                    </defs>
                    <g fill="url(#collect)" fill-rule="evenodd">
                        <g transform="translate(9 6)">
                            <use fill="#000" filter="url(#a)" xlink:href="#b"></use>
                            <use fill="#FFF" xlink:href="#b"></use>
                        </g>
                        <path fill="url(#collect)" d="M30.09 26.279l-.508.207c-.212.086-.387.22-.53.378a22.97 22.97 0 0 1-3.949.343c-5.042 0-9.103-1.717-9.103-3.138v-2.365c1.696 1.462 5.495 2.365 9.104 2.365 3.444 0 7.159-.802 9.103-2.09v2.917c-.553.52-1.579 1.03-2.911 1.44a1.453 1.453 0 0 0-.65-.166c-.191 0-.379.036-.556.109zm2.01 1.028l-.106-.252c-.003-.006-.008-.01-.01-.017.397-.134.77-.28 1.116-.436-.131.13-.248.277-.322.454l-.106.251a6.059 6.059 0 0 0-.572 0zm-5.766 2.378l-.21.5a1.398 1.398 0 0 0-.018 1.032c-.332.014-.665.024-1.003.024-5.043 0-9.103-1.717-9.103-3.138V25.74c1.695 1.462 5.494 2.364 9.103 2.364 1.191 0 2.41-.102 3.582-.28 0 .18.034.363.109.539l.107.254a5.564 5.564 0 0 0-.403.396l-.259-.104a1.465 1.465 0 0 0-.557-.11c-.59 0-1.12.347-1.348.887zm-.21 5.022l.211.5c.076.18.193.326.325.456-.506.038-1.023.061-1.557.061-5.105 0-9.103-1.771-9.103-4.034v-1.916c1.695 1.461 5.494 2.364 9.103 2.364.599 0 1.204-.032 1.81-.078l.256.104a5.781 5.781 0 0 0 0 .563l-.256.104a1.43 1.43 0 0 0-.788 1.876zm8.083-13.846c-1.252 1.18-4.935 2.311-9.103 2.311-5.042 0-9.103-1.716-9.103-3.137C16 17.772 20 16 25.104 16c5.104 0 9.103 1.772 9.103 4.035v.826zm2.951 12.815a.49.49 0 0 1-.3-.507 4.297 4.297 0 0 0 0-.96.488.488 0 0 1 .3-.505l.513-.213c.271-.112.401-.424.288-.695l-.204-.493a.533.533 0 0 0-.695-.289l-.515.214a.486.486 0 0 1-.566-.136 4.261 4.261 0 0 0-.691-.692.483.483 0 0 1-.136-.565l.213-.516a.532.532 0 0 0-.289-.695l-.493-.204a.532.532 0 0 0-.694.288l-.213.514a.49.49 0 0 1-.506.3 4.098 4.098 0 0 0-.96 0 .49.49 0 0 1-.507-.3l-.212-.514a.532.532 0 0 0-.695-.288l-.493.204a.532.532 0 0 0-.288.695l.213.516a.483.483 0 0 1-.136.565 4.261 4.261 0 0 0-.692.692.486.486 0 0 1-.565.136l-.515-.214a.533.533 0 0 0-.696.289l-.204.493a.531.531 0 0 0 .288.695l.513.213c.202.083.326.29.301.505a4.312 4.312 0 0 0 0 .96.49.49 0 0 1-.3.507l-.514.212a.531.531 0 0 0-.288.696l.204.493c.112.271.425.4.696.287l.515-.213a.484.484 0 0 1 .565.136c.203.257.435.489.692.692a.485.485 0 0 1 .136.565l-.213.516a.532.532 0 0 0 .288.695l.493.204a.532.532 0 0 0 .695-.288l.212-.513a.49.49 0 0 1 .507-.301 4.297 4.297 0 0 0 .96 0 .49.49 0 0 1 .506.3l.213.514a.53.53 0 0 0 .694.288l.493-.204a.532.532 0 0 0 .289-.695l-.213-.516a.483.483 0 0 1 .136-.564c.256-.203.488-.436.692-.693a.483.483 0 0 1 .565-.136l.515.213a.532.532 0 0 0 .695-.287l.204-.493a.532.532 0 0 0-.288-.696l-.513-.212zm-6.766-.447a2.363 2.363 0 0 1 2.836-2.835 2.342 2.342 0 0 1 1.757 1.756 2.363 2.363 0 0 1-2.836 2.836 2.344 2.344 0 0 1-1.757-1.757z" transform="translate(9 6)"></path>
                    </g>
                </svg>
            </div>
            <div class="box-title">Q&A</div>
            <div class="box-description">Ask questions and provide answers</div>
        </a>
    </div>
    <div class="category-box col-md-3 col-sm-6 col-xs-12">
        <a class="category-box__link" href="/content/idea/list.html">
            <div class="category-box__icon">
                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="70" height="70" viewBox="0 0 70 70">
                    <defs>
                        <circle id="b" cx="26" cy="26" r="26"></circle>
                        <filter id="a" width="157.7%" height="157.7%" x="-28.8%" y="-23.1%" filterUnits="objectBoundingBox">
                            <feMorphology in="SourceAlpha" operator="dilate" radius="1" result="shadowSpreadOuter1"></feMorphology>
                            <feOffset dy="3" in="shadowSpreadOuter1" result="shadowOffsetOuter1"></feOffset>
                            <feGaussianBlur in="shadowOffsetOuter1" result="shadowBlurOuter1" stdDeviation="3.5"></feGaussianBlur>
                            <feColorMatrix in="shadowBlurOuter1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.1 0"></feColorMatrix>
                        </filter>
                        <linearGradient id="c" x1="0%" x2="80.329%" y1="-11.562%" y2="92.56%">
                            <stop offset="0%" stop-color="#1356F2"></stop>
                            <stop offset="100%" stop-color="#07ADD6"></stop>
                        </linearGradient>
                    </defs>
                    <g fill="none" fill-rule="evenodd">
                        <g transform="translate(9 6)">
                            <use fill="#000" filter="url(#a)" xlink:href="#b"></use>
                            <use fill="#FFF" xlink:href="#b"></use>
                        </g>
                        <path fill="url(#c)" fill-rule="nonzero" d="M26 14c6.628 0 12 5.372 12 12 0 6.627-5.372 12-12 12s-12-5.373-12-12c0-6.628 5.372-12 12-12zm.288 16.795c.016 0 .033 0 .05-.002.39-.018.73-.246.858-.577l2.667-6.848 1.168 3.26c.143.332.5.55.897.55h2.7c.531 0 .963-.386.963-.863s-.432-.863-.963-.863h-2.04l-1.874-4.894c-.146-.337-.459-.57-.914-.551-.403.006-.76.237-.892.579l-2.755 7.074-2.605-4.93a.966.966 0 0 0-.773-.49 1.005 1.005 0 0 0-.866.341l-2.037 2.916h-2.513c-.53 0-.962.386-.962.863 0 .476.431.863.962.863h2.994c.303 0 .589-.128.77-.345l1.368-2.116 2.927 5.54c.16.302.5.493.87.493z" transform="translate(9 6)"></path>
                    </g>
                </svg>
            </div>
            <div class="box-title">Ideas</div>
            <div class="box-description">Help us improve AnswerHub!</div>
        </a>
    </div>
    <div class="category-box col-md-3 col-sm-6 col-xs-12">
        <a class="category-box__link" href="http://localhost:80">
            <div class="category-box__icon">
                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="70" height="70" viewBox="0 0 70 70">
                    <defs>
                        <circle id="b" cx="26" cy="26" r="26"></circle>
                        <filter id="a" width="157.7%" height="157.7%" x="-28.8%" y="-23.1%" filterUnits="objectBoundingBox">
                            <feMorphology in="SourceAlpha" operator="dilate" radius="1" result="shadowSpreadOuter1"></feMorphology>
                            <feOffset dy="3" in="shadowSpreadOuter1" result="shadowOffsetOuter1"></feOffset>
                            <feGaussianBlur in="shadowOffsetOuter1" result="shadowBlurOuter1" stdDeviation="3.5"></feGaussianBlur>
                            <feColorMatrix in="shadowBlurOuter1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.1 0"></feColorMatrix>
                        </filter>
                        <linearGradient id="users" x1="100%" x2="18.444%" y1="100%" y2="0%">
                            <stop offset="0%" stop-color="#ffb6f7"></stop>
                            <stop offset="100%" stop-color="#7767fa"></stop>
                        </linearGradient>
                    </defs>
                    <g fill="none" fill-rule="evenodd">
                        <g transform="translate(9 6)">
                            <use fill="#000" filter="url(#a)" xlink:href="#b"></use>
                            <use fill="#FFF" xlink:href="#b"></use>
                        </g>
                        <path fill="url(#users)" fill-rule="nonzero" d="M25.653 16a5.556 5.556 0 1 1-.001 11.112 5.556 5.556 0 0 1 0-11.112zm7.879 20H17.827c-1.334 0-2.033-1.567-1.774-2.276a6.668 6.668 0 0 1 6.267-4.39h6.667a6.667 6.667 0 0 1 6.334 4.582c.216.656-.485 2.084-1.79 2.084z" transform="translate(9 6)"></path>
                    </g>
                </svg>
            </div>
            <div class="box-title">Help Center</div>
            <div class="box-description">Learn more</div>
        </a>
    </div>

<@security.isNotAuthenticated>
    <div class="category-box col-md-3 col-sm-6 col-xs-12">
        <a class="category-box__link" href="/users/login.html">
            <div class="category-box__icon">
                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="70" height="70" viewBox="0 0 70 70">
                    <defs>
                        <circle id="b" cx="26" cy="26" r="26"></circle>
                        <filter id="a" width="157.7%" height="157.7%" x="-28.8%" y="-23.1%" filterUnits="objectBoundingBox">
                            <feMorphology in="SourceAlpha" operator="dilate" radius="1" result="shadowSpreadOuter1"></feMorphology>
                            <feOffset dy="3" in="shadowSpreadOuter1" result="shadowOffsetOuter1"></feOffset>
                            <feGaussianBlur in="shadowOffsetOuter1" result="shadowBlurOuter1" stdDeviation="3.5"></feGaussianBlur>
                            <feColorMatrix in="shadowBlurOuter1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.1 0"></feColorMatrix>
                        </filter>
                        <linearGradient id="action" x1="100%" y1="90%" x2="10%" y2="0%">
                            <stop offset="0%" style="stop-color:rgb(0,178,217);stop-opacity:1"></stop>
                            <stop offset="100%" style="stop-color:rgb(0,52,196);stop-opacity:1"></stop>
                        </linearGradient>
                    </defs>
                    <g fill="none" fill-rule="evenodd">
                        <g transform="translate(9 6)">
                            <use fill="#000" filter="url(#a)" xlink:href="#b"></use>
                            <use fill="#FFF" xlink:href="#b"></use>
                        </g>
                        <path fill="url(#action)" fill-rule="nonzero" d="M26 14c6.627 0 12 5.372 12 12 0 6.627-5.373 12-12 12s-12-5.373-12-12c0-6.628 5.373-12 12-12zm0 2.4c-5.302 0-9.6 4.299-9.6 9.6 0 5.302 4.298 9.6 9.6 9.6s9.6-4.298 9.6-9.6c0-5.301-4.298-9.6-9.6-9.6zm0 2.4A7.2 7.2 0 1 1 26 33.2 7.2 7.2 0 0 1 26 18.8zm0 2.4a4.8 4.8 0 1 0 0 9.6 4.8 4.8 0 0 0 0-9.6zm0 2.4a2.4 2.4 0 1 1 0 4.8 2.4 2.4 0 0 1 0-4.8z" transform="translate(9 6)"></path>
                    </g>
                </svg>
            </div>
            <div class="box-title">Sign In</div>
            <div class="box-description"></div>
        </a>
    </div>
</@security.isNotAuthenticated>

<@security.isAuthenticated>

    <div class="category-box col-md-3 col-sm-6 col-xs-12">
        <a  href="<@url obj=currentUser />">

            <div class="category-box__icon">
    <@teamhub.avatar currentUser 60 />
            </div>
            <div id="profile-box-fix" class="box-title">${userUtils.displayName(currentUser)}</div>
            <div class="box-description">View your user profile</div>
        </a>
    </div>
</@security.isAuthenticated>
</body>