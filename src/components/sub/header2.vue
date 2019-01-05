<template>
        <header class="mui-bar mui-bar-nav header"> 
                <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
            <a class="mui-icon mui-icon-bars mui-pull-right"></a>
            <div class="mui-input-row mui-search">
                    <input type="search" class="mui-input-clear" placeholder="">
                    <a><span class="mui-icon mui-icon-camera"></span></a>
                </div>
        </header>
    </template>
    <script>
        export default {
            data(){
                return{}
            }
        }
    </script>
    <style scoped>
        .header{
            background:rgba(235, 94, 94, 0.425);
            position:relative
        }
        .header>.mui-search{
        position: absolute;
        width:18rem;
        margin:0.2rem 2rem 0;
    }
    .header>.mui-search>input{
        background: rgba(252, 250, 250, 0.486);
    }
    .header>.mui-search>a{
        position: absolute;
        z-index:99;
        top:-0.1rem;
        left:16rem
    }
    .header>a,.header>.mui-search>a{
        color:rgba(236, 75, 75, 0.767)
    }
    </style>