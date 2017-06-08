var menu = menu || new Array();
menu.push({
    id : 1,
    parentId : 0,
    name : '分局1',
    url : '/User/Index.aspx',
    level : 1,
    css : 'nobg '
});
menu.push({
    id : 101,
    parentId : 1,
    name : '县局1',
    url : '/User/UserEdit.aspx',
    level : 2
});
menu.push({
    id : 2,
    parentId : 0,
    name : '分局2',
    url : '/User/BlogEdit.aspx',
    level : 1
});
menu.push({
    id : 201,
    parentId : 2,
    name : '县局2',
    url : '/User/LinksList.aspx',
    level : 2
});

menu.push({
    id : 3,
    parentId : 0,
    name : '分局3',
    url : '/User/ArticleList.aspx',
    level : 1
});
menu.push({
    id : 301,
    parentId : 3,
    name : '县局3',
    url : '/User/ArticleAdd.aspx',
    level : 2
});
menu.push({
    id : 4,
    parentId : 0,
    name : '分局4',
    url : '/User/AlbumList.aspx',
    level : 1
});
menu.push({
    id : 401,
    parentId : 4,
    name : '县局4',
    url : '/User/AlbumAdd.aspx',
    level : 2,
    css : 'hidden '
});

menu.push({
    id : 5,
    parentId : 0,
    name : '分局5',
    url : '/User/ArticleCommentList.aspx',
    level : 1
});
menu.push({
    id : 501,
    parentId : 5,
    name : '县局5',
    url : '/User/LeaveList.aspx',
    level : 2
});

menu.push({
    id : 6,
    parentId : 0,
    name : '分局6',
    url : '/Admin/LogList.aspx',
    level : 1
});
menu.push({
    id : 601,
    parentId : 6,
    name : '县局6',
    url : '/Admin/FileManager.aspx',
    level : 2
});

if (menu.render) {
    menu.render();
}