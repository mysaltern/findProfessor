<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $model app\models\Professors */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="professors-form">

    <?php $form = ActiveForm::begin(); ?>
        
        <?php
        if (isset($model->active))
        {
                $active = $model->active;
        }
        else
        {
                $active = '';
        }

        echo $form->field($model, 'sex')->dropDownList(['0' => 'professor', '1' => ' doctor'], ['options' =>
                [
                    $active => ['selected ' => true]
                ]]
            , ['prompt' => 'انتخاب']);
        ?>
    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'last_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'description')->textarea(['maxlength' => true]) ?>

    <?= $form->field($model, 'url')->textInput(['maxlength' => true]) ?>
        <?php

        $dataPost = ArrayHelper::map(\app\models\University::find()->asArray()->where(['active'=>1])->all(), 'id', 'name');
        echo $form->field($model, 'university_id')
            ->dropDownList(
                $dataPost, ['id' => 'university_id']
            );
        ?>
        <?php
        $dataPost = ArrayHelper::map(\app\models\Department::find()->asArray()->all(), 'id', 'name');
        echo $form->field($model, 'department_id')
            ->dropDownList(
                $dataPost, ['id' => 'department_id']
            );
        ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
