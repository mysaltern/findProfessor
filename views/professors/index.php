<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ProfessorsSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Professors';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="professors-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Professors', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'sex',
            'name',
            'last_name',
            'email:email',
            //'description',
            //'url:url',
            //'university_id',
            //'department_id',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>


</div>
