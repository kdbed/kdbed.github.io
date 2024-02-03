+++
title = "Python - Visualize Active Directory Data"
author = ["svejk"]
tags = ["activeDirectory"]
draft = false
+++

## Pandas to plot AD Data {#pandas-to-plot-ad-data}

```python { linenos=true, linenostart=1 }
import pandas
import matplotlib.pyplot as plt
from sqlalchemy import create_engin

engine = create_engine("activedirectory:///?User=cn=Bob F,ou=Employees,dc=Domain&Password=bob123&Server=10.0.1.2&Port=389")
df = pandas.read_sql("SELECT Id, LogonCount FROM User WHERE CN = 'Administrator'", engine)

df.plot(kind="bar", x="Id", y="LogonCount")
plt.show()
```

From: [cdata.com](https://www.cdata.com/kb/tech/activedirectory-python-pandas.rst)
