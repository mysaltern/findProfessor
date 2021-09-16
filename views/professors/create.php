<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Professors */

$this->title = 'Create Professors';
$this->params['breadcrumbs'][] = ['label' => 'Professors', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="professors-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
