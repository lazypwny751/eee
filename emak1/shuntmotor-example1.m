#!/usr/bin/octave -qf

# ÖRNEK SORU:
# 230V DC Şönt Motorun Endüvi Direnci 0,25Ω ve uyartım direnci 150Ω’dur. Motor yüksüz olarak 1200 d/d hız ile dönerken kaynaktan IL=4A akım çeker. Tam yükte ise endüvi akımı Ia=45A olmaktadır.
# 
# a) Yüksüz iken endüvi akımını,
# b) Yüksüz iken endüvi gücünü,
# c) Tam yükte verimi,
# d) Tam yükte d/d olarak hızı hesaplayınız.

# Soruya göre değişkenlerin tanımı.
global Vt = 230		# Kaynak gerilimi.
global n0 = 1200	# Devir daim.
global Il = 4 		# Hat akımı.
global Iamax = 45 	# Armatür akımı.
global Rf = 150 	# Uyartım direnci.
global Ra = 0.25 	# Endüvi direnci.

printf("%s\n", program_name())

printf("\na) Yüksüz iken endüvi akımı:\n")
printf("Uyartım akımı Vt / Rf.\n")
If = Vt / Rf
printf("Armatür akımı(endüvi).\n")
Ia = Il - If

printf("\nb) Yüksüz durumda endüvi gücü:\n")
printf("endüvi gerilimi.\n")
Ec = Vt - Ia * Ra
printf("Endüvi gücü.\n")
Pa = Ec * Ia

printf("\nc) Tam yükte verim.\n")
printf("Endüvi gerilimi (Vt - Ia(max) * Ra).\n")
Ecmax = Vt - Iamax * Ra
printf("Endüvi gücü (Ec(max) * Ia(max)).\n")
Pamax = Ecmax * Iamax
printf("Kayıpsız endüvi gücü (Pa(max) - Pa).\n")
P0 = Pamax - Pa
printf("Motor gücü (Vt * (If + Ia(max))).\n")
Pin = cast((Vt * (If + Iamax)), "uint32")
printf("Son olarak verim (P0 / Pin).\n")
Verim = cast(P0, "double") / cast(Pin, "double")

printf("\nd) Tam yükte devir.\n")
n = n0 * (Ecmax / Ec)
