#########################################################
# Raspberry Etude                                       #
# Written and produced by James Gray and Shen Tan, 2015 #
#########################################################

# Choose between two possible synthesizers and wait
# for one of four possible time durations before the next
# note event occurs.
define :choosesynth do
  if one_in(2)
    use_synth :pretty_bell
  else
    use_synth :fm
  end
  sleep choose([0, 0.1, 0.2, 0.3])
end

# Define the percussion sample instruments and their parameters.
# There is a one in six chance that the sample chosen will be a low bass drum
# tone, which will ring out for five seconds before another percussion sample is
# triggered. Otherwise, one of two other samples will be chosen with randomized
# amplitude, pan, and filter cutoff parameters.
define :chooseperc do
  if one_in(6)
    sample "./samples/sine.wav",
      amp: 1.5,
      rate: choose([0.825, 1.075]),
      sustain: 0,
      release: 4,
      cutoff: rrand(60, 120)
    sleep 5
  else
    sample choose([
        "./samples/bubbles.wav",
        "./samples/lushpad.wav"
    ]),
      amp:     3,
      rate:    choose([1, 1.2, 1.5, 1.8, 2.25]),
      sustain: 0,
      release: choose([0.5, 0.8, 1.6]),
      cutoff:  rrand(30, 120),
      pan:     choose([-0.75, -0.5, 0, 0.5, 0.75])
    sleep choose([0, 0.5, 0.8, 1.2])
  end
end

# Define the melodic sample instruments and their parameters.
# There is a 50% chance of either sample being chosen for any given
# note event, and each sample will play at one of five possible rates,
# chosen at random and corresponding to C, Eb, G, Bb and D. Each sample
# uses various values for amplitude, filter cutoff, and pan - many chosen
# at random.
define :choosemelody do
  if one_in(2)
    sample "./samples/bell.wav",
      amp:     3,
      rate:    choose([1, 1.2, 1.5, 1.8, 2.25]),
      sustain: 0,
      release: choose([0.5, 0.8, 1.6]),
      cutoff:  rrand(60, 120),
      pan:     choose([-1, -0.5, 0, 0.5, 1])
    sleep choose([0, 0.5, 0.8, 1.2])
  else
    sample "./samples/square.wav",
      amp:     3,
      rate:    choose([1, 1.2, 1.5, 1.8, 2.25]),
      sustain: 0,
      release: choose([0.5, 0.8, 1.6]),
      cutoff:  rrand(60, 120),
      pan:     choose([-0.75, -0.5, 0, 0.5, 0.75])
    sleep choose([0, 0.5, 0.8, 1.2])
  end
end

# Define the main chord progression, using various synthesizers
# and parameters. The main progression contains clusters of three
# notes each, and each individual note is chosen from a set of
# possible notes at random. These note clusters outline Cm9 and Fm9
# chords, transposed in various ways.
define :chord_progression do
  # Cm9
  use_synth :beep
  play choose([:C4, :Eb4, :G4]),  amp: 0.5
  choosesynth
  play choose([:Eb4, :G4, :Bb4]), amp: 0.25, pan: 1
  play choose([:G4, :Bb4, :D5]),  amp: 0.25, pan: -1
  
  # Cm9
  use_synth :beep
  play choose([:C4, :Eb4, :G4]),  amp: 0.5, attack: 0.2, release: 0.5
  choosesynth
  play choose([:Eb4, :G4, :Bb4]), amp: 0.25, pan: 1,  attack: 0.2, release: 0.5
  play choose([:G4, :Bb4, :D5]),  amp: 0.25, pan: -1, attack: 0.2, release: 0.5
  sleep 0.5
  
  # Fm9
  use_synth :beep
  play choose([:F4, :Ab4, :C5]),  amp: 0.5, release: 0.5
  choosesynth
  play choose([:Ab4, :C5, :Eb5]), amp: 0.25, pan: 1,  release: 0.5
  play choose([:C5, :Eb5, :G5]),  amp: 0.25, pan: -1, release: 0.5
  sleep 0.5

  # Cm9
  use_synth :beep
  play choose([:C3, :Eb3, :G3]),  amp: 0.5
  choosesynth
  play choose([:Eb3, :G3, :Bb3]), amp: 0.25, pan: 1
  play choose([:G3, :Bb3, :D4]),  amp: 0.25, pan: -1
  sleep 1

  # Cm9
  use_synth :beep
  play choose([:C3, :Eb3, :G3]),  amp: 0.5, attack: 0.2, release: 0.5
  choosesynth
  play choose([:Eb3, :G3, :Bb3]), amp: 0.25, pan: 1,  attack: 0.2, release: 0.5
  play choose([:G3, :Bb3, :D4]),  amp: 0.25, pan: -1, attack: 0.2, release: 0.5
  sleep 0.5

  # Fm9
  use_synth :beep
  play choose([:F3, :Ab3, :C4]),  amp: 0.5, release: 0.3
  choosesynth
  play choose([:Ab3, :C4, :Eb4]), amp: 0.25, pan: 1,  release: 0.5
  play choose([:C4, :Eb4, :G4]),  amp: 0.25, pan: -1, release: 0.5
  sleep 1
  
  # Cm9
  use_synth :beep
  play choose([:C2, :Eb2, :G2]),  amp: 0.5
  choosesynth
  play choose([:Eb2, :G2, :Bb2]), amp: 0.25, pan: 1
  play choose([:G2, :Bb2, :D3]),  amp: 0.25, pan: -1
  sleep 1
  
  # Cm9
  use_synth :beep
  play choose([:C2, :Eb2, :G2]),  amp: 0.5, attack: 0.2, release: 0.5
  choosesynth
  play choose([:Eb2, :G2, :Bb2]), amp: 0.25, pan: 1,  attack: 0.2, release: 0.5
  play choose([:G2, :Bb2, :D3]),  amp: 0.25, pan: -1, attack: 0.2, release: 0.5
  sleep 0.5
  
  # Fm9
  use_synth :beep
  play choose([:F2, :Ab2, :C3]),  amp: 0.5, release: 0.3
  choosesynth
  play choose([:Ab2, :C3, :Eb3]), amp: 0.25, pan: 1,  release: 0.5
  play choose([:C3, :Eb3, :G3]),  amp: 0.25, pan: -1, release: 0.5
  sleep 1
end

# Begin playing the sampled sounds.
in_thread do
  use_random_seed rrand(0, 500000)
  loop do
    choosemelody
    chooseperc
  end
end

# Begin playing the synthesizers simultaneously alongside
# the sampled sounds.
loop do
  use_random_seed rrand(0, 500000)
  chord_progression
end