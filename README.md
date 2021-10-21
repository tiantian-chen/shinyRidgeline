 <h1><center> shiny ridgeline 的使用说明 </center></h1>


*****

# 1.ridgeline
>
## **1.1 上传数据**
>用户可根据需求选择上传文件或是粘贴数据，数据集应该包含两列，第一列为名称，第二列为值。用户可先点击Upload input data选择上传文件，再点击Browse上传本地数据；用户如果想要了解数据格式和画出的图形效果，可以先点击Download example data下载样本文档，再点击Browse上传样本数据。用户也可以点击Paste input data来选择粘贴上传数据，此时文本框中就会出现样本数据。
## **1.2 画图**
>点击Submit!运行这个shiny程序，进而出来用上传数据画出的ridgeline图。
## **1.3 标题命名**
>用户可通过修改"Plot title"来按照自己的喜好对ridgeline图进行命名。
## **1.4 标题大小**
>"Plot title font size"这个功能部件可让用户根据自己的喜好调整标题大小，1为一个数值单位，要求调整后的数值为整数。
## **1.5 标签标题命命**
>用户可根据自己的喜好对ridgeline图的标签标题通过修改"X axis title"和"Y axis title"从而重新命名。
## **1.6 标签标题大小**
>滑动"Axis label font size"用户可根据自己的喜好调整坐标轴刻度的大小
## **1.7 标签标题大小**
>滑动"Axis title font size"用户可根据自己的喜好调整坐标轴标题的大小，1为一个数值单位，要求调整后的数值为整数。
## **1.8 重叠程度**
>用户可根据自己的喜好调整ridgeline页面中"Plot overlap degree"进而改变数据展示的重叠程度。
## **1.9 数据颜色**
>数据颜色是使山脊图的数据不单调，数据之间的关系变得更鲜活明显，在横轴方向更能体现分布的位置差异性，展示了不同类别数据在同一因素的不同水平下的分布差异。用于渲染数据的颜色，可以由应用程序随机分配，也可以由用户指定。默认情况下，及为选中System color按钮，将使用shinyridgeline指定的颜色。若要自定义数据的一种颜色，用户应选中Custom color按钮，可根据自己的需求用调色板选择不同水平的颜色。
## **1.10 图片大小**
>用户可根据自己的喜好对ridgeline图进行拖拉，进而调整其大小。
## **1.11 下载图片大小**
>通过点击“Adjust the image download ratio”中“Plot download height”可以调整下载图片的高,同时“Plot download width”可以调整下载图片的宽的比例。
# 2.下载
>在完成ridgeline图编辑之后，可以将ridgeline图下载到本地，本应用程序提供了两种下载文件的格式，分别是pdf和svg文件格式，用户可根据点击"Download PDF File"和"Download SVG File"进而来依据喜好和需求选择下载。
