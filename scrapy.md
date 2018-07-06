# scrapy教程 #
## 准备工作 ##
windows下安装scrapy：pip install scrapy  
archlinux下安装scrapy：pip install scrapy  
注意问题：可能会安装不上，提示无法安装twisted包，可以百度解决办法。  
## 基本模型 ##
1. 新建项目：scrapy startproject xxx  
在命令行下输入此命令，新建了一个名称为xxx的项目  
2. 明确目标：编辑items.py文件  
3. 制作爬虫：scrapy genspider xxx  
产生xxx.py文件，编辑这个文件，此文件中定义爬虫规则
4. 储存内容：通过编辑piplines.py设计管道存储爬取的内容  

### 案例 ###
编辑items.py
                import scrapy

                class DmozItem(scrapy.Item):
                    title = scrapy.Field()
                    link = scrapy.Field()
                    desc = scrapy.Field()

在项目的spider目录下，命令行中键入`scrapy genspider demoz`  
编辑生成的demoz.py文件
                import scrapy

                class DmozSpider(scrapy.Spider):
                    name = "dmoz"
                    allowed_domains = ["dmoz.org"]
                    start_urls = [
                        "http://www.dmoz.org/Computers/Programming/Languages/Python/Books/",
                        "http://www.dmoz.org/Computers/Programming/Languages/Python/Resources/"
                    ]

                    def parse(self, response):
                        filename = response.url.split("/")[-2]
                        with open(filename, 'wb') as f:
                            f.write(response.body)
