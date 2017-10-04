scelta = menu('Scegli un oscillatore.',' Libero non Smorzato', ...
         'Libero Sottosmorzato', 'Libero Sovrasmorzato',...
         'Forzato Smorzato');
    
switch(scelta)
    case 1
        m=1; h=10; k=0; f=0; y0=[1; 0];
        titolo='Libero non Smorzato';
        name='libero_non_smorzato.jpg';
    case 2
        m=1; h=10; k=0.5; f=0; y0=[1; 0];
        titolo='Libero Sottosmorzato';
        name='libero_sottosmorzato.jpg';
    case 3
        m=1; h=10; k=10; f=0; y0=[1; 0];
        titolo='Libero Sovrasmorzato';
        name='libero_sovrasmorzato.jpg';
    case 4
        m=2; h=15; k=0.75; f=25; y0=[2; 0];
        titolo='Forzato Smorzato';
        name='forzato_smorzato.jpg';
end
        
f=@(x,y) [y(2); (-h*y(1)-k*y(2)+f)/m];
[x,u]=ode45(f, [0, 60], y0);

hold off
clear plot
hold on
plot(x,u(:,1),'r')
plot(x,u(:,2),'b')
legend('posizione','velocita')
xlabel('tempo')
title(titolo)
print(name,'-djpeg')
