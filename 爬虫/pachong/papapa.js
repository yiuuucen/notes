var http=require('http')
var fs=require('fs')
var cheerio=require('cheerio')
var request=require('request')
var i=0;
var url="http://www.ss.pku.edu.cn/index.php/newscenter/news/3472-%E8%BD%AF%E4%BB%B6%E4%B8%8E%E5%BE%AE%E7%94%B5%E5%AD%90%E5%AD%A6%E9%99%A2%E6%A0%A1%E5%8F%8B%E4%BC%9A%E5%8F%AC%E5%BC%80%E7%AC%AC%E5%9B%9B%E6%AC%A1%E7%90%86%E4%BA%8B%E4%BC%9A";

function pa(x){
    start(x);
}

function start(y){
    http.get(y,function(res){
        var html='';
        var titles=[];
        res.setEncoding('utf-8');


        res.on('data',function(chunk){
            html+=chunk;
        })

        res.on('end',function(){
            var $=cheerio.load(html);

            var time1=$('.article-info a:nth-child(2)').text().trim().match(/(\d)+/g);
            var time=time1[0]+'-'+time1[1]+'-'+time1[2];

            var news_item={
                title:$('.article-title a').text().trim(),
                Time:time,
                link:'http://www.ss.pku.edu.cn'+$('.article-title a').attr('href'),
                author:$('.article-info a:first-child').text().trim().substr(3),
                i:i=i+1,
            };

            console.log(news_item);

            var news_title=$('.article-title a').text().trim();
            //saveContent($,news_title);
            //savedImg($,news_title);

            var nextLink='http://www.ss.pku.edu.cn'+$('li.next a').attr('href');
            var str1=nextLink.split('-');
            var str=encodeURI(str1[0]);

            if (i <= 3) {
                pa(str);
            }

        });


    }).on('error',function(err){
        console.log(err);
    })
}


function  saveContent($,news_title){

    $('.article-content>p').each(function(index,item){
        var wenzi=$(this).text();
        if(wenzi.length>20){
                wenzi=wenzi+'\n';
                console.log(wenzi)
                //fs.appendFile('./data/'+news_title+'.txt',wenzi,'utf-8',function(err){
                //    if(err){
                //        console.log(err);
                //    }
                //})


        }
    })

}
pa(url);