
cm = load_cmap('twilight');

figure(1);
L = 160*membrane(1,100);
contourf(L,50,'EdgeColor','none');
colormap(cm);
