# Importing the Keras libraries and packages
from tensorflow import keras
from keras.models import Sequential
from keras.layers import Convolution2D
from keras.layers import MaxPooling2D
from keras.layers import Flatten
from keras.layers import Dense
from keras.layers import Dropout

import tensorflow as tf
from tensorflow.python.compiler.mlcompute import mlcompute

tf.compat.v1.disable_eager_execution()
mlcompute.set_mlc_device(device_name='gpu')
print("is_apple_mlc_enabled %s" % mlcompute.is_apple_mlc_enabled())
print("is_tf_compiled_with_apple_mlc %s" % mlcompute.is_tf_compiled_with_apple_mlc())
print(f"eagerly? {tf.executing_eagerly()}")
print(tf.config.list_logical_devices())

print("Num GPUs Available: ", len(tf.config.list_physical_devices('GPU')))

# Step 1 - Building the CNN

# # Initializing the CNN
# model = Sequential()
# model.add(Convolution2D(32, 3, 3, input_shape=(200, 355, 1), activation="relu"))
# model.add(Convolution2D(64, 3, 3, activation="relu"))
# model.add(MaxPooling2D(pool_size=(2, 2)))
# model.add(Convolution2D(128, 3, 3, activation="relu"))
# model.add(MaxPooling2D(pool_size=(2, 2)))
# model.add(Flatten())
# model.add(Dense(64, activation="relu"))
# model.add(Dropout(0.5))
# model.add(Dense(64, activation="relu"))
# model.add(Dropout(0.5))
# model.add(Dense(10, activation="softmax"))

model = Sequential()
model.add(Convolution2D(8, (3, 3), padding='same',activation='relu', input_shape=(200, 355, 1)))
model.add(MaxPooling2D(pool_size=(2,2)))
model.add(Convolution2D(16, (3, 3), padding='same',activation='relu'))
model.add(MaxPooling2D(pool_size=(2,2)))
model.add(Convolution2D(32, (3, 3), padding='same',activation='relu'))
model.add(MaxPooling2D(pool_size=(2,2)))
model.add(Convolution2D(64, (3, 3), padding='same',activation='relu'))
model.add(MaxPooling2D(pool_size=(2,2)))
model.add(Flatten())
model.add(Dense(128, activation='relu'))
model.add(Dense(10, activation='softmax'))


# Compiling the CNN
# categorical_crossentropy for more than 2
model.compile(optimizer='adam', loss='categorical_crossentropy', metrics=['accuracy'])
print(model.summary())

# Step 2 - Preparing the train/test data and training the model

# Code copied from - https://keras.io/preprocessing/image/
from keras.preprocessing.image import ImageDataGenerator

train_datagen = ImageDataGenerator(
        rescale=1./255,
        horizontal_flip=True)

test_datagen = ImageDataGenerator(rescale=1./255)

batch_size = 32
training_set = train_datagen.flow_from_directory('Images/Train',
                                                 target_size=(200, 355),
                                                 batch_size=batch_size,
                                                 color_mode='grayscale',
                                                 class_mode='categorical')

test_set = test_datagen.flow_from_directory('Images/Test',
                                            target_size=(200, 355),
                                            batch_size=batch_size,
                                            color_mode='grayscale',
                                            class_mode='categorical')
model.fit(
        training_set,
        steps_per_epoch=4216 / batch_size, # No of images in training set
        epochs= 10,
        validation_data=test_set,
        validation_steps=668 / batch_size)# No of images in test set


# Saving the model
model.save_weights('model.h5')
model_json = model.to_json()
with open("model-bw.json", "w") as json_file:
    json_file.write(model_json)


