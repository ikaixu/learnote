%��ȡ���ݵĹ��̣������ݲ��ж�ȡѵ��������ȡ��ģ�õ�ͼ�񣩣�������ת��Ϊһ������
%�ٷֺž���matlab�����ע�ͷ��š�matlab������Ҫ���öϵ���е��ԣ�һ��һ�εĶ�ȡ���򣬳����е����ݿ����������ڿ�����
allsamples=[];%����ѵ��ͼ��
for i=1:40
    for j=1:5
        a=imread(strcat('e:\ORL\s',num2str(i),'\',num2str(j),'.jpg'));% ��ȡͼ��ת��Ϊ����һ��112x92�ľ���
        b=a(1:112*92); % ʸ���������������ת�����ȼ۹��̣������ų�һ�У��ڶ����ֻ��һ�еľ���ת�á�
        b=double(b);% double�ĺ��岻���
        allsamples=[allsamples; b]; % allsamples ��һ��M * N ����allsamples ��ÿһ�����ݴ���һ��ͼƬ������M��200
    end
end
samplemean=mean(allsamples); % ���������ľ�ֵ��������һ���ֵ������ͬ�������ǽ���ֵ����ת�ú�Ľ����

for i=1:200
    xmean(i,:)=allsamples(i,:)-samplemean; % �����ÿһ�ж���ȥ��������Ӧ�ľ�ֵ����Ԫͳ�ƿα������������
end;

%%pca����
% ��ȡ����ֵ����������������ֵ�ֽ����Ԫͳ�ƿα���
sigma=xmean*xmean'; 
[v d]=eig(sigma);
d1=diag(d);

% ������ֵ��С�Խ�������
dsort = flipud(d1);
vsort = fliplr(v);

%����ѡ��90%������
dsum = sum(dsort);
    dsum_extract = 0;
    p = 0;
    while( dsum_extract/dsum < 0.9)
        p = p + 1;
        dsum_extract = sum(dsort(1:p));
    end
i=1;

base = xmean' * vsort(:,1:p) * diag(dsort(1:p).^(-1/2));
allcoor = allsamples * base;
accu = 0;


%%���Թ��̣����Լ�����
for i=1:40
    for j=6:10 %����40 x 5 ������ͼ��
        a=imread(strcat('e:\ORL\s',num2str(i),'\',num2str(j),'.jpg'));
        b=a(1:10304);
        b=double(b);
        tcoor= b * base; %�������꣬��1��p �׾���
        for k=1:200
            mdist(k)=norm(tcoor-allcoor(k,:));
        end;
%���׽���
    [dist,index2]=sort(mdist);
        class1=floor( (index2(1)-1)/5 )+1;
        class2=floor((index2(2)-1)/5)+1;
        class3=floor((index2(3)-1)/5)+1;
        if class1~=class2 && class2~=class3
                class=class1;
            elseif class1==class2
                class=class1;
            elseif class2==class3
                class=class2;
            end;
            if class==i
                accu=accu+1;
            end;
    end;
end;
accuracy=accu/200 %���ʶ��


