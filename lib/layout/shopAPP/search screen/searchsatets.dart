abstract class searchshopstate{}

class shoppsearchintialstate extends searchshopstate{}

class shoppsearchloadingstate extends searchshopstate{}

class shoppsearchsucessstate extends searchshopstate{

}

class shoppsearcherrorstate extends searchshopstate{
  final String error;
  shoppsearcherrorstate(this.error);
}
