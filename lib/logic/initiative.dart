class Initiative{

// //data Корневой элемент данных array
late int id; //Идентификатор
// String code; //Номер инициативы 
late String url; //Ссылка на инициативу 
// List<Object> level; // Уровень инициативы 
// int levelid; // Идентификатор уровня 
late String leveltitle; // Наименование уровня 
// List<Object> status; // Статус инициативы 
// int statusid; // Идентификатор статуса 
late String statustitle; // Наименование статуса 
// List<Object> result; // Информация о решении по инициативе 
// int resultid; // Идентификатор решения 
// String resulttitle; // Наименование решения 
late String title; // Наименование инициативы 
late String description; // Описание инициативы
// List<Object> attachment; // Дополнительные материалы 
// List<Object> attachmentphoto; // Сопроводительные фотографии 
// String attachmentphototitle; // Наименование фотографии 
// String attachmentphotourl; // Ссылка на фотографию 
// List<Object> attachmentdocument; // Сопроводительные документы инициативы 
// String attachmentdocumenttitle; // Наименование документа 
// String attachmentdocumenturl; // Ссылка на документ 
// List<Object> decision; // Предлагаемое решение по инициативе 
late String decisiontext; // Текст предлагаемого решения 
late String prospective; // Описание проблемы 
// List<Object> category; // Категория инициативы 
// int categoryid; // Идентификатор категории 
List<String> categorytitle = []; // Наименование категории 
// List<Object> geo; // Информация о местоположении 
late String geoarea; // Федеральный округ 
late String georegion; // Регион 
// String geomunicipality; // Муниципалитет
// List<Object> date; // Информация о датах инициативы 
// List<Object> datepoll; // Дата публикации инициативы 
late int datepollbegin; // Дата начала голосования  (Unix timestamp)
late int datepollend; // Дата окончания голосования  (Unix timestamp)
// List<Object> vote; // Информация о голосах инициативы 
// double voteprogress; // Прогресс набора необходимого порога голосов, % float
// int votethreshold; // Порог голосов 
// int voteaffirmative; // Подано голосов «За» инициативу 
// int votenegative; // Подано голосов «Против» инициативы 
// List<Object> authorship; // Другие инициативы на голосованииавтора 
// int authorshipid; // Идентификатор другой инициативы на голосовании автора 

//   Initiative(
//      this.id, 
//      this.code,
//      this.url,
//      this.level, 
//      this.levelid, 
//      this.leveltitle, 
//      this.status,
//      this.statusid,
//      this.statustitle, 
//      this.result,
//      this.resultid,
//      this.resulttitle,
//      this.title,
 //     this.description,  
//      this.attachment,
//      this.attachmentphoto,
//      this.attachmentphototitle, 
//      this.attachmentphotourl,
//      this.attachmentdocument,
//      this.attachmentdocumenttitle,
//      this.attachmentdocumenturl,
//      this.decision,
//      this.decisiontext,
//      this.prospective,
//      this.category,
//      this.categoryid,
//      this.categorytitle, 
//      this.geo, 
//      this.geoarea,
//      this.georegion,
//      this.geomunicipality, 
//      this.date,
//      this.datepoll,
//      this.datepollbegin,
//      this.datepollend,
//      this.vote,
//      this.voteprogress,
//      this.votethreshold,
//      this.voteaffirmative,
//      this.votenegative,
//      this.authorship,
//      this.authorshipid,
 //  );
}