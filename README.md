# Pollexa

Pollexa, kullanıcıların çeşitli konular hakkında anketler oluşturup paylaşabildiği bir sosyal anket platformudur. Bu proje, sevenapps firmasına işe giriş taskı olarak geliştirilmiştir.

## Özellikler

- **Storyboard yerine XIB kullanımı**: Proje boyunca tüm UI bileşenleri için XIB dosyaları kullanıldı.
- **Renk ve Görsel Dosyaları**: Projede kullanılan tüm renkler ve görseller ayrı dosyalar olarak organize edilip projeye aktarıldı.
- **Base Yapı**: Tüm view controller'lar için ortak bir temel yapı oluşturuldu.
- **Özelleştirilmiş Bileşenler**: Projede özelleştirilmiş bileşenler kullanıldı ve bunlar kolayca tekrar kullanılabilir şekilde tasarlandı.
- **Mock Servis**: Veri çekme işlemleri için mock servisler kullanıldı.
- **Sticky Button**: Kullanıcı sayfada aşağıya kaydırdığında sağ alt köşede beliren ve yukarı çıkmak için kullanılan bir buton eklendi.
- **Gizlenen HeaderView**: Kullanıcı sayfada aşağıya kaydırdığında gizlenen, yukarı kaydırdığında tekrar görünen bir header view eklendi.
- **Oy Kullanımı Sonrası Veri Güncelleme**: Kullanıcı bir ankete oy kullandığında, ilgili anket hücresi koleksiyondan kaldırılıyor ve oy oranları güncelleniyor.

## Proje Yapısı

- **MVVM Mimarisi**: Proje, Model-View-ViewModel (MVVM) mimari deseni kullanılarak yapılandırıldı.
- **View Components**: Projede kullanılan tüm view bileşenleri XIB dosyaları olarak oluşturuldu ve her biri için özelleştirilmiş view modelleri yazıldı.
- **Service Layer**: Veri çekme işlemleri için mock servisler kullanıldı ve bu servisler service katmanında toplandı.

## Kullanılan Teknolojiler

- **Swift 5**
- **Xcode 15.3**
- **iOS 17 SDK**
- **UIKit**
- **MVVM Mimari Deseni**
