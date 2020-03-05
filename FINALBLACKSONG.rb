#Black Song
sandman = "C:/Users/joselyn_gallagher/Desktop/samples/test.wav"
scream1 = "C:/Users/joselyn_gallagher/Desktop/samples/scream1.wav"
scream2 = "C:/Users/joselyn_gallagher/Desktop/samples/scream2.wav"
section1v = "C:/Users/joselyn_gallagher/Desktop/samples/black_vocals.wav"
section2v = "C:/Users/joselyn_gallagher/Desktop/samples/black_vocals2.wav"
riff = "C:/Users/joselyn_gallagher/Desktop/samples/black_guitar.wav"
guitar = "C:/Users/joselyn_gallagher/Desktop/samples/guitar_test2.wav"
black = "C:/Users/joselyn_gallagher/Desktop/samples/black_black.wav"
prec_vocals = "C:/Users/joselyn_gallagher/Desktop/samples/prec_vocals.wav"
prec_guitar = "C:/Users/joselyn_gallagher/Desktop/samples/prec_g.wav"
acdc_guitar1 = "C:/Users/joselyn_gallagher/Desktop/samples/acdcguitar.wav"
acdc_guitar2 = "C:/Users/joselyn_gallagher/Desktop/samples/acdcguitar2.wav"
acdc_vocals1 = "C:/Users/joselyn_gallagher/Desktop/samples/acdc_vocals1.wav"
acdc_vocals2 = "C:/Users/joselyn_gallagher/Desktop/samples/acdc_vocals3.wav"
outro = "C:/Users/joselyn_gallagher/Desktop/samples/outro3.wav"
pan = 1
drum = 1

define :bass_loop do |note|
  play note, amp: 2
  sleep 0.5
end

define :bass_loop_eg do
  4.times do
    bass_loop :e2
  end
  4.times do
    bass_loop :g2
  end
end

define :drums_s1 do |s1|
  sample s1, amp: 3
  sleep 0.5
end

define :drums_s2 do |s1, s2|
  sample s1, amp: 3
  sample s2, amp: 2
  sleep 0.5
end

define :drums_s3 do |s1, s2, s3|
  sample s1, amp: 3
  sample s2, amp: 2
  sample s3, amp: 1
  sleep 0.5
end

#INTRODUCTION ////////////////
sample sandman, amp: 2
sleep 26.5
2.times do
  sample scream1, pan: pan
  sleep 0.5
  pan = pan - 1
end
sample scream2

#SONG 1 - SECTION 1 //////////
use_bpm 90

sample section1v, amp: 3
sleep 4.25
use_synth :fm
live_loop :bass do
  2.times do
    3.times do
      bass_loop_eg
      3.times do
        bass_loop :b2
      end
      play :a2, amp: 2
      sleep 1
      bass_loop :a2
      bass_loop :g2
      bass_loop :a2
    end
    bass_loop_eg
    bass_loop :b2
    bass_loop :d3
    2.times do
      bass_loop :a2
    end
    sleep 3.5
  end
  stop
end

sleep 8
live_loop :drums do
  5.times do
    sleep 1
    sample :drum_snare_soft, amp: drum
    drum = drum + 1
    sleep 2
    sample :drum_snare_soft, amp: drum
    drum = drum + 1
    sleep 1
  end
  stop
end

sleep 25.5
drum = 10
live_loop :drums2 do
  4.times do
    sample :drum_heavy_kick, amp: drum
    sleep 0.5
    sample :drum_heavy_kick, amp: drum
    sleep 0.5
    sample :drum_snare_soft, amp: drum
    sleep 2
    sample :drum_snare_soft, amp: drum
    sleep 2
    sample :drum_snare_soft, amp: drum
    sleep 3
  end
  stop
end

live_loop :synth do
  use_synth :dtri
  use_bpm 90
  3.times do
    3.times do
      2.times do
        play :b7, amp: 0.15
        play :as7, amp: 0.15
        sleep 0.5
      end
      play :fs7, amp: 0.15
      sleep 0.5
      play :g7, amp: 0.15
      sleep 0.5
    end
    3.times do
      play :b7, amp: 0.15
      play :as7, amp: 0.15
      sleep 0.5
    end
    play :fs7, amp: 0.15
    sleep 0.5
  end
  stop
end
sleep 27.25
sample riff

#SECTION 2 W/ GUITAR ///////////
sleep 4.25
sample section2v, amp: 5
sleep 1.8
sample guitar
live_loop :drums do
  2.times do
    3.times do
      drums_s3 :drum_heavy_kick, :drum_splash_hard, :drum_snare_soft
      drums_s1 :drum_snare_soft
      drums_s2 :drum_heavy_kick, :drum_snare_soft
      drums_s1 :drum_snare_soft
      3.times do
        drums_s2 :drum_heavy_kick, :drum_snare_soft
      end
      drums_s1 :drum_snare_soft
      3.times do
        drums_s2 :drum_heavy_kick, :drum_snare_soft
      end
      drums_s3 :drum_heavy_kick, :drum_splash_hard, :drum_snare_soft
      drums_s1 :drum_snare_soft
      3.times do
        drums_s2 :drum_heavy_kick, :drum_snare_soft
      end
    end
    drums_s3 :drum_heavy_kick, :drum_splash_hard, :drum_snare_soft
    drums_s1 :drum_snare_soft
    drums_s2 :drum_heavy_kick, :drum_snare_soft
    drums_s1 :drum_snare_soft
    2.times do
      drums_s2 :drum_heavy_kick, :drum_snare_soft
    end
    drums_s3 :drum_heavy_kick, :drum_splash_hard, :drum_snare_soft
    2.times do
      drums_s3 :drum_heavy_kick, :drum_splash_hard, :drum_cymbal_hard
    end
    drums_s3 :drum_heavy_kick, :drum_snare_soft, :drum_splash_hard
    sleep 2
  end
  stop
end
sleep 31
sample guitar
sleep 30
sample prec_vocals, amp: 5
sleep 0.75
sample prec_guitar

#TRANSITION ////////////////
use_bpm 92
amp1 = 1
amp2 = 1
array = 0
array2 = 0

notes = [:g5, :e5, :d5, :b, :a4, :a4, :g4]
notes_2 = [:gs2, :a2, :as2, :b2]

define :acdc_array do
  play notes[array], amp: 3
  array = array + 1
  sleep 0.25
  if array == 6
    array = 0
    print "array is repeating"
  end
end

define :acdc_array_2 do
  play :b2, amp: 3
  sleep 0.25
  play notes_2[array2], amp: 3
  array2 = array2 + 1
  sleep 0.5
  if array2 == 3
    array2 = 0
    print "array2 is repeating"
  end
end

define :acdc_base do |n, s|
  play n, amp: 3
  sleep s
end

define :acdc_repeatcodes do
  acdc_base :e2, 1.5
  acdc_base :d3, 0.25
  acdc_base :d3, 0.25
  acdc_base :d3, 1.5
  acdc_base :cs3, 0.25
  acdc_base :cs3, 0.25
end

sleep 24
live_loop :transition_snares do
  3.times do
    8.times do
      sample :drum_snare_soft, amp: amp1
      amp1 = amp1 + 0.5
      sleep 1
    end
  end
  stop
end

live_loop :transition_black do
  2.times do
    sample black, amp: amp2
    amp2 = amp2 + 4
    sleep 16
  end
  stop
end

sleep 8
use_synth :fm
acdc_repeatcodes
acdc_base :cs3, 4
acdc_repeatcodes
acdc_base :cs3, 1
4.times do
  acdc_array_2
end

use_synth :prophet
acdc_repeatcodes
acdc_base :cs3, 2.25
7.times do
  acdc_array
end
play :e4, amp: 3
acdc_repeatcodes
acdc_base :cs3, 1
4.times do
  acdc_array_2
end

#SONG 2 //////////////////
live_loop :acdc_guitar do
  2.times do
    sample acdc_guitar1, amp: 3
    sleep 16.25
  end
  stop
end
sleep 0.25
sample acdc_vocals1, amp: 3
sleep 30.65
sample acdc_vocals2, amp: 3
sleep 1.6
sample acdc_guitar2, amp: 3

#OUTRO //////////////////
sleep 31
sample :vinyl_rewind, amp: 5
sleep 3.5
sample outro, amp: 3
sleep 19.5
sample scream1, amp: 3